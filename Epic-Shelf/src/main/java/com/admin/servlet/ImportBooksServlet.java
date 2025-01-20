package com.admin.servlet;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import com.DAO.BooksDAOImp;
import com.DB.DBconnect;
import com.entity.Books;

@WebServlet("/import_books")
@MultipartConfig
public class ImportBooksServlet extends HttpServlet {
    
    private String getCellValueAsString(Cell cell) {
        if (cell == null) {
            return "";
        }
        
        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue();
            case NUMERIC:
                // Format numeric value to remove decimal places if it's a whole number
                double value = cell.getNumericCellValue();
                if (value == Math.floor(value)) {
                    return String.format("%.0f", value);
                }
                return String.valueOf(value);
            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());
            case FORMULA:
                try {
                    return String.valueOf(cell.getNumericCellValue());
                } catch (IllegalStateException e) {
                    return cell.getStringCellValue();
                }
            default:
                return "";
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {
            Part filePart = req.getPart("excelFile");
            String fileName = filePart.getSubmittedFileName();
            String uploadPath = getServletContext().getRealPath("") + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            try (FileInputStream fis = new FileInputStream(filePath);
                 XSSFWorkbook workbook = new XSSFWorkbook(fis)) {
                Sheet sheet = workbook.getSheetAt(0);
                Iterator<Row> rows = sheet.iterator();
                BooksDAOImp dao = new BooksDAOImp(DBconnect.getConn());

                // Skip header row
                if (rows.hasNext()) {
                    rows.next();
                }

                while (rows.hasNext()) {
                    Row row = rows.next();
                    
                    // Get values using the helper method
                    String cover = getCellValueAsString(row.getCell(0));
                    String title = getCellValueAsString(row.getCell(1));
                    String author = getCellValueAsString(row.getCell(2));
                    String description = getCellValueAsString(row.getCell(3));
                    String category = getCellValueAsString(row.getCell(4));
                    String price = getCellValueAsString(row.getCell(5));
                    String status = getCellValueAsString(row.getCell(6));
                    String email = getCellValueAsString(row.getCell(7));

                    // Skip row if essential fields are empty
                    if (title.isEmpty() || author.isEmpty()) {
                        continue;
                    }

                    Books book = new Books(cover, title, author, description, category, price, status, email);
                    dao.addBooks(book);
                }
            }

            // Clean up the uploaded file
            new File(filePath).delete();

            session.setAttribute("successImpMsg", "Books imported successfully!");
            resp.sendRedirect("admin/addBook.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedImpMsg", "Failed to import books: " + e.getMessage());
            resp.sendRedirect("admin/addBook.jsp");
        }
    }
}