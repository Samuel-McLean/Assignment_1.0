package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import uts.checkout.*;
import uts.movie.*;
import uts.user.*;

public final class index2_0_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">\n");
      out.write("        <title>Index</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 String moviesPath = application.getRealPath("WEB-INF/movies.xml");
      out.write("\n");
      out.write("        ");
      uts.movie.MoviesApplication moviesApp = null;
      synchronized (application) {
        moviesApp = (uts.movie.MoviesApplication) _jspx_page_context.getAttribute("moviesApp", PageContext.APPLICATION_SCOPE);
        if (moviesApp == null){
          moviesApp = new uts.movie.MoviesApplication();
          _jspx_page_context.setAttribute("moviesApp", moviesApp, PageContext.APPLICATION_SCOPE);
          out.write("\n");
          out.write("            ");
          org.apache.jasper.runtime.JspRuntimeLibrary.handleSetProperty(_jspx_page_context.findAttribute("moviesApp"), "filePath",
moviesPath);
          out.write("\n");
          out.write("        ");
        }
      }
      out.write("\n");
      out.write("        ");
 String userPath = application.getRealPath("WEB-INF/users.xml");
      out.write("\n");
      out.write("        ");
      uts.user.UserApplication userApp = null;
      synchronized (application) {
        userApp = (uts.user.UserApplication) _jspx_page_context.getAttribute("userApp", PageContext.APPLICATION_SCOPE);
        if (userApp == null){
          userApp = new uts.user.UserApplication();
          _jspx_page_context.setAttribute("userApp", userApp, PageContext.APPLICATION_SCOPE);
          out.write("\n");
          out.write("            ");
          org.apache.jasper.runtime.JspRuntimeLibrary.handleSetProperty(_jspx_page_context.findAttribute("userApp"), "filePath",
userPath);
          out.write("\n");
          out.write("        ");
        }
      }
      out.write("\n");
      out.write("        ");
Movies movies = moviesApp.getMovies();
      out.write("\n");
      out.write("        ");
Users users = userApp.getUsers();
      out.write("\n");
      out.write("        ");

            User user = (User) session.getAttribute("user");
            boolean hasUser = false;
            if(user != null){
                hasUser = true;
            }
        
      out.write("\n");
      out.write("        <h2>Index Page</h2>\n");
      out.write("        ");
 if(!hasUser) {
                session.setAttribute("user", user);
        
      out.write("\n");
      out.write("        <table>\n");
      out.write("            <tr><td align=\"right\"><u><a href=\"login.jsp\">Login</a></u> &emsp;</tr>            \n");
      out.write("        </table>\n");
      out.write("        <div>");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "search_dates.jsp", out, true);
      out.write("</div>    \n");
      out.write("        <div>");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "search_genre.jsp", out, true);
      out.write("</div> \n");
      out.write("        <div>");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "search_title.jsp", out, true);
      out.write("</div> \n");
      out.write("        <div>");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "movie_search.jsp", out, true);
      out.write("</div>  \n");
      out.write("        ");
} else {
      out.write("\n");
      out.write("        <table>\n");
      out.write("            <tr><u><a href=\"edit_user.jsp\">Account</a></u> &emsp; <u><a href=\"logout.jsp\">Logout</a></u>&emsp; </td></tr>            \n");
      out.write("        </table>\n");
      out.write("        \n");
      out.write("        <div>");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "search_dates.jsp", out, true);
      out.write("</div>    \n");
      out.write("        <div>");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "search_genre.jsp", out, true);
      out.write("</div> \n");
      out.write("        <div>");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "search_title.jsp", out, true);
      out.write("</div>       \n");
      out.write("        <div>");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "movie_search.jsp", out, true);
      out.write("</div> \n");
      out.write("        ");
}
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
