
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File, java.io.PrintWriter"%>
<%@page import="java.text.SimpleDateFormat,java.util.Calendar,java.util.Date"%>

<%
Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
    // 파일이 저장되는 경로
    String path = request.getSession().getServletContext().getRealPath("nui")+"/uploadFiles_fsms"+"/"+year;

    int size = 1024 * 1024 * 10; // 저장가능한 파일 크기
    String file = ""; // 업로드 한 파일의 이름(이름이 변경될수 있다)
    String originalFile = ""; // 이름이 변경되기 전 실제 파일 이름

    // 실제로 파일 업로드하는 과정
    try{

    	File Folder = new File(path);

		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try {
				Folder.mkdir(); //폴더 생성합니다.

			} catch (Exception e) {
				e.getStackTrace();
			}
		}

		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		System.err.println("------------------filename-------------");
		System.out.println(multi.getParameter("name"));

		Enumeration files = multi.getFileNames();
		String str = (String) files.nextElement(); // 파일 이름을 받아와 string으로 저장

		file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
		originalFile = multi.getOriginalFileName(str); // 원래의 파일이름 가져옴

		PrintWriter out1 = response.getWriter();

		out1.println("asdassd");

	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>