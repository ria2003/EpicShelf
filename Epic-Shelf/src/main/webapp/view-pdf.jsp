<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>PDF Viewer - EpicShelf</title>
    <%@include file="all_components/allCss.jsp"%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.11.338/pdf.min.js"></script>
    <style>
        .container {
            display: flex;
            justify-content: center;
            margin-bottom:20px;
        }
        .card {
            width: 800px;  /* Fixed width for the card */
        }
        #viewerContainer {
            width: 100%;
            height: 800px;
            overflow: hidden;
            position: relative;
            background-color: #404040;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #pdfRenderer {
            max-width: 100%;
            height: 100%;
            display: block;
        }
        .toolbar {
            background-color: #f8f9fa;
            padding: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .page-controls {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        button {
            padding: 5px 15px;
            border: none;
            background-color: #28a745;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        #pageNum {
            width: 50px;
            text-align: center;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    
    <div class="container mt-3">
        <div class="card">
            <div class="toolbar">
                <div class="page-controls">
                    <button id="prev" class="btn-success">Previous</button>
                    <span>Page: <input type="text" id="pageNum" disabled/> / <span id="pageCount"></span></span>
                    <button id="next" class="btn-success">Next</button>
                </div>
            </div>
            <div id="viewerContainer">
                <canvas id="pdfRenderer"></canvas>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp"%>
    
    <script>
        // Disable right-click
        document.addEventListener('contextmenu', event => event.preventDefault());
        
        // Initialize PDF.js
        pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.11.338/pdf.worker.min.js';
        
        let pdfDoc = null;
        let pageNum = 1;
        let scale = 1.0;
        const canvas = document.getElementById('pdfRenderer');
        const ctx = canvas.getContext('2d');
        
        // Get book ID from URL
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        const bookId = urlParams.get('bid');
        
        // Load the PDF
        pdfjsLib.getDocument('viewPdfContent?bid=' + bookId).promise
            .then(function(pdf) {
                pdfDoc = pdf;
                document.getElementById('pageCount').textContent = pdf.numPages;
                renderPage(pageNum);
            })
            .catch(function(error) {
                console.error('Error loading PDF:', error);
            });
            
        function renderPage(num) {
            pdfDoc.getPage(num).then(function(page) {
                const viewport = page.getViewport({ scale: scale });
                
                // Calculate scale to fit width
                const containerWidth = document.getElementById('viewerContainer').clientWidth * 0.8; // 80% of container width
                scale = containerWidth / viewport.width;
                
                const scaledViewport = page.getViewport({ scale: scale });
                canvas.height = scaledViewport.height;
                canvas.width = scaledViewport.width;
                
                const renderContext = {
                    canvasContext: ctx,
                    viewport: scaledViewport
                };
                
                page.render(renderContext);
                document.getElementById('pageNum').value = num;
            });
        }
        
        // Button event listeners
        document.getElementById('prev').addEventListener('click', () => {
            if (pageNum <= 1) return;
            pageNum--;
            renderPage(pageNum);
        });
        
        document.getElementById('next').addEventListener('click', () => {
            if (pageNum >= pdfDoc.numPages) return;
            pageNum++;
            renderPage(pageNum);
        });
        
        // Disable keyboard shortcuts
        document.addEventListener('keydown', function(e) {
            if (e.ctrlKey || e.metaKey) {
                e.preventDefault();
            }
        });
    </script>
</body>
</html>