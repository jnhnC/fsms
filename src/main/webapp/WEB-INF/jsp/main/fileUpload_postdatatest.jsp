<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>

<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>

<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.nexacro17.xapi.data.*"%>
<%@ page import="com.nexacro17.xapi.tx.*"%>

<%
	String chkType = request.getHeader("Content-Type");
	if( chkType == null )
		return;

	request.setCharacterEncoding("UTF-8");

	String contextRealPath = request.getSession().getServletContext().getRealPath("/");

	String PATH222 = request.getParameter("PATH22");
	String savePath="";

	if(PATH222 != null){
		savePath = contextRealPath + PATH222;
	}else{
		savePath = contextRealPath + "nexacro17\\FileSample\\";
	}
	//savePath = contextRealPath + "nexacro17\\FileSample\\";
        File targetDir = new File(savePath);

  	 // 디렉토리가 없을 경우 생성
  	 if(!targetDir.exists()) {
 	  targetDir.mkdirs();
	 }

	int maxSize = 1000 * 1024 * 1024;

	PlatformData resData = new PlatformData();
	VariableList resVarList = resData.getVariableList();

	String sRtn = "";
	try
	{
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());

		Enumeration files = multi.getFileNames();

		// MultiPart 전송 파라메터는 MultipartRequest.getParamter 이용해야함
		String Path = multi.getParameter("PATH");

		String filepath1 = multi.getParameter("filepath");
		String filename = multi.getParameter("filename");
		String fullPath_2 = contextRealPath + filepath1;
		File targetDir2 = new File(fullPath_2);

		 // 디렉토리가 없을 경우 생성
		 if(!targetDir2.exists()) {
		  targetDir2.mkdirs();
		 }

		DataSet ds = new DataSet("ds_uploadresult");

		ds.addColumn(new ColumnHeader("fileName", DataTypes.STRING));
		ds.addColumn(new ColumnHeader("fileSize", DataTypes.LONG));
		ds.addColumn(new ColumnHeader("fileType", DataTypes.STRING));
		ds.addColumn(new ColumnHeader("savePath", DataTypes.STRING));

		int j=0;
		while (files.hasMoreElements())
		{

			System.out.println("j count:" + j);
			sRtn = sRtn + "Row(" + (j++) + ")";
			String name = (String)files.nextElement();

			sRtn = sRtn + name + "  ";
			String fileName = multi.getFilesystemName(name);
			String type = multi.getContentType(name);


			File f = multi.getFile(name);
			int row = ds.newRow();
			ds.set(row, "fileName", fileName);
			ds.set(row, "fileType", type);
			if (Path != null)
			{
				ds.set(row, "savePath", Path);
			}

			if (f != null)
			{
				ds.set(row, "fileSize", f.length());
			}
			if(filepath1 != null || filepath1 != ""){
				File newFile = new File(savePath + filename + fileName.substring(fileName.lastIndexOf(".")));
				f.renameTo(newFile);
				//if(!f.renameTo(newFile)){
				//	byte[] buf = new byte[1024];
				//	FileInputStream fin = new FileInputStream(f);
				//	FileOutputStream fout = new FileOutputStream(newFile);
				//	int read = 0;
				//	while((read=fin.read(buf,0,buf.length))!=-1){
				//		fout.write(buf,0,read);
				//	}
				//
				//	fin.close();
				//	fout.close();
				//	f.delete();
				//}
			}



		}
		resVarList.add("ErrorCode", 0);
		resVarList.add("ErrorMsg", "Success" );

	}
	catch (Exception e)
	{
		System.out.println(e.getMessage());
		DataSet dsError = new DataSet("ds_error");
		dsError.addColumn(new ColumnHeader("ErrorMsg", DataTypes.STRING));
		dsError.addColumn(new ColumnHeader("ErrorCode", DataTypes.LONG));

		dsError.set(dsError.newRow(), "ErrorCode", -1);
		dsError.set(dsError.newRow(), "ErrorMsg", e.getMessage());
		resData.addDataSet(dsError);

	}

	HttpPlatformResponse res = new HttpPlatformResponse(response, request);
	res.setContentType(PlatformType.CONTENT_TYPE_XML);
	res.setCharset("UTF-8");
	res.setData(resData);
	res.sendData();

%>
