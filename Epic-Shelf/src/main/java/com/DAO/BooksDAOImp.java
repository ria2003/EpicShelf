package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Books;

public class BooksDAOImp implements BooksDAO {

	private Connection conn;

	public BooksDAOImp(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(Books b) {
        boolean f = false;
        try {
            String sql = "INSERT INTO all_books(cover, title, author, description, category, price, status, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getCover());  // image
            ps.setString(2, b.getTitle());  // title
            ps.setString(3, b.getAuthor());    // author
            ps.setString(4, b.getDescription());  // description
            ps.setString(5, b.getCategory());  // category
            ps.setString(6, b.getPrice());     // price
            ps.setString(7, b.getStatus());    // status
            ps.setString(8, b.getEmail());     // email

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<Books> getAllBooks() {
        List<Books> list = new ArrayList<>();
        Books b = null;

        try {
            String sql = "SELECT * FROM all_books";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Books();
                b.setBookId(rs.getInt("id"));  // id
                b.setCover(rs.getString("cover"));  // image
                b.setTitle(rs.getString("title"));  // title
                b.setAuthor(rs.getString("author"));   // author
                b.setDescription(rs.getString("description"));  // description
                b.setCategory(rs.getString("category"));  // category
                b.setPrice(rs.getString("price"));  // price
                b.setStatus(rs.getString("status"));  // status
                b.setEmail(rs.getString("email"));  // email
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Books getBookById(int id) {
        Books b = null;

        try {
            String sql = "SELECT * FROM all_books WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Books();
                b.setBookId(rs.getInt("id"));  // id
                b.setCover(rs.getString("cover"));  // image
                b.setTitle(rs.getString("title"));  // title
                b.setAuthor(rs.getString("author"));   // author
                b.setDescription(rs.getString("description"));  // description
                b.setCategory(rs.getString("category"));  // category
                b.setPrice(rs.getString("price"));  // price
                b.setStatus(rs.getString("status"));  // status
                b.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }


	@Override
	public boolean updateEditBooks(Books b) {
		boolean f=false;
		try {
			String sql = "update all_books set cover=?, title=?, author=?, description=?, category=?, price=?, status=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getCover());  // image
            ps.setString(2, b.getTitle());  // title
            ps.setString(3, b.getAuthor());    // author
            ps.setString(4, b.getDescription());  // description
            ps.setString(5, b.getCategory());  // category
            ps.setString(6, b.getPrice());     // price
            ps.setString(7, b.getStatus());    // status
			ps.setInt(8, b.getBookId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean deleteBooks(int id) {
		boolean f=false;
		try {
			String sql = "delete from all_books where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
			
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Books> getFictionBook() {
		
		List<Books> list=new ArrayList<Books>();
		Books b=null;
		
		try {
			String sql="select * from all_books where category=? order by id DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Fiction");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new Books();
				b.setBookId(rs.getInt(1));
				b.setCover(rs.getString(2));
				b.setTitle(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setPrice(rs.getString(7));
				b.setStatus(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
				i++;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Books> getRecentBook() {
		List<Books> list=new ArrayList<Books>();
		Books b=null;
		
		try {
			String sql="select * from all_books where category in (?, ?, ?, ?) order by id DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Fiction");
			ps.setString(2, "Science");
			ps.setString(3, "Biography");
			ps.setString(4, "Kids");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new Books();
				b.setBookId(rs.getInt(1));
				b.setCover(rs.getString(2));
				b.setTitle(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setPrice(rs.getString(7));
				b.setStatus(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
				i++;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Books> getScienceBook() {
		List<Books> list=new ArrayList<Books>();
		Books b=null;
		
		try {
			String sql="select * from all_books where category=? order by id DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Science");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new Books();
				b.setBookId(rs.getInt(1));
				b.setCover(rs.getString(2));
				b.setTitle(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setPrice(rs.getString(7));
				b.setStatus(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
				i++;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Books> getBiographyBook() {
		List<Books> list=new ArrayList<Books>();
		Books b=null;
		
		try {
			String sql="select * from all_books where category=? order by id DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Biography");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new Books();
				b.setBookId(rs.getInt(1));
				b.setCover(rs.getString(2));
				b.setTitle(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setPrice(rs.getString(7));
				b.setStatus(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
				i++;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Books> getKidsBook() {
		List<Books> list=new ArrayList<Books>();
		Books b=null;
		
		try {
			String sql="select * from all_books where category=? order by id DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Kids");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new Books();
				b.setBookId(rs.getInt(1));
				b.setCover(rs.getString(2));
				b.setTitle(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setPrice(rs.getString(7));
				b.setStatus(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
				i++;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Books> getOldBook() {
		List<Books> list=new ArrayList<Books>();
		Books b=null;
		
		try {
			String sql="select * from all_books where category=? order by id DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new Books();
				b.setBookId(rs.getInt(1));
				b.setCover(rs.getString(2));
				b.setTitle(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setPrice(rs.getString(7));
				b.setStatus(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
				i++;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Books> getAllFictionBook() {
		List<Books> list=new ArrayList<Books>();
		Books b=null;
		
		try {
			String sql="select * from all_books where category=? order by id DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Fiction");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b=new Books();
				b.setBookId(rs.getInt(1));
				b.setCover(rs.getString(2));
				b.setTitle(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setPrice(rs.getString(7));
				b.setStatus(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Books> getAllScienceBook() {
		List<Books> list=new ArrayList<Books>();
		Books b=null;
		
		try {
			String sql="select * from all_books where category=? order by id DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Science");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b=new Books();
				b.setBookId(rs.getInt(1));
				b.setCover(rs.getString(2));
				b.setTitle(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setPrice(rs.getString(7));
				b.setStatus(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Books> getAllBiographyBook() {
		List<Books> list=new ArrayList<Books>();
		Books b=null;
		
		try {
			String sql="select * from all_books where category=? order by id DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Biography");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b=new Books();
				b.setBookId(rs.getInt(1));
				b.setCover(rs.getString(2));
				b.setTitle(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setPrice(rs.getString(7));
				b.setStatus(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Books> getAllKidsBook() {
		List<Books> list=new ArrayList<Books>();
		Books b=null;
		
		try {
			String sql="select * from all_books where category=? order by id DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Kids");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b=new Books();
				b.setBookId(rs.getInt(1));
				b.setCover(rs.getString(2));
				b.setTitle(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setPrice(rs.getString(7));
				b.setStatus(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean deleteSoldBooks(String email, String cat, int id) {
		boolean f=false;
		try {
			String sql = "delete from all_books where category=? and email=? and id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
			
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Books> getAllRecentBook() {
		List<Books> list=new ArrayList<Books>();
		Books b=null;
		
		try {
			String sql="select * from all_books where category in (?, ?, ?, ?) order by id DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Fiction");
			ps.setString(2, "Science");
			ps.setString(3, "Biography");
			ps.setString(4, "Kids");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=20) {
				b=new Books();
				b.setBookId(rs.getInt(1));
				b.setCover(rs.getString(2));
				b.setTitle(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setPrice(rs.getString(7));
				b.setStatus(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
				i++;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Books> getAllOldBook() {
		List<Books> list=new ArrayList<Books>();
		Books b=null;
		
		try {
			String sql="select * from all_books where category=? order by id DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b=new Books();
				b.setBookId(rs.getInt(1));
				b.setCover(rs.getString(2));
				b.setTitle(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setPrice(rs.getString(7));
				b.setStatus(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Books> getSoldBooks(String email, String cat) {
		List<Books> list=new ArrayList<Books>();
		Books b=null;
		
		try {
			String sql="select * from all_books where category=? and email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b=new Books();
				b.setBookId(rs.getInt(1));
				b.setCover(rs.getString(2));
				b.setTitle(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setPrice(rs.getString(7));
				b.setStatus(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Books> getBookBySearch(String ch) {
		List<Books> list=new ArrayList<Books>();
		Books b=null;
		
		try {
			String sql="select * from all_books where title like ? or author like ? or category like ?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b=new Books();
				b.setBookId(rs.getInt(1));
				b.setCover(rs.getString(2));
				b.setTitle(rs.getString(3));
				b.setAuthor(rs.getString(4));
				b.setDescription(rs.getString(5));
				b.setCategory(rs.getString(6));
				b.setPrice(rs.getString(7));
				b.setStatus(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	

	
	

}
