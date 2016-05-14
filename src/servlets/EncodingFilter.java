package servlets;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Created by Vyacheslav.
 */
@WebFilter(filterName = "EncodingFilter")
public class EncodingFilter implements Filter {
//Этот фильтр нужен, чтобы кирилица попадала в базу как есть , а не бракозябрами
private String encoding;

    public EncodingFilter() {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding(encoding);
        chain.doFilter(request, response);
    }

    public void init(FilterConfig fConfig) throws ServletException {
        encoding = fConfig.getInitParameter("encoding");
    }

}
