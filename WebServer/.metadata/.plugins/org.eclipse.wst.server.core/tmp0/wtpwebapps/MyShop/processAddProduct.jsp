<%@ page contentType="text/html; charset=utf-8" %>

<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>

<%
request.setCharacterEncoding("UTF-8");

String filename = "";
String realFolder = request.getRealPath("./resources/images");
System.out.println(realFolder);
int maxSize = 30 * 1024 * 1024;
String encType = "utf-8";

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

String productId = multi.getParameter("productId");
String name = multi.getParameter("name");
String unitPrice = multi.getParameter("unitPrice");
String description = multi.getParameter("description");
String publisher = multi.getParameter("publisher");
String category = multi.getParameter("category");
String unitsInStock = multi.getParameter("unitsInStock");
String condition = multi.getParameter("condition");

Integer price;

if (unitPrice.isEmpty())
	price = 0;
else
	price = Integer.valueOf(unitPrice);

long stock;

if (unitsInStock.isEmpty())
	stock = 0;
else
	stock = Long.valueOf(unitsInStock);

Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String fileName = multi.getFilesystemName(fname);

ProductRepository dao = ProductRepository.getInstance();

Product new_product = new Product();

new_product.setProductId(productId);
new_product.setPname(name);
new_product.setUnitPrice(price);
new_product.setDescription(description);
new_product.setPublisher(publisher);
new_product.setCategory(category);
new_product.setUnitsInStock(stock);
new_product.setCondition(condition);
new_product.setFilename(fileName);

dao.addProduct(new_product);

response.sendRedirect("products.jsp");
%>