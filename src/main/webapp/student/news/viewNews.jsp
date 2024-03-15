<%@page import="Models.News"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.NewsDAO"%>
<div class="page-wrapper" style="min-height: 264px;">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="page-title">List News</h3>
                    <ul class="breadcrumb">

                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <%
                // Create an instance of NewsDAO
                NewsDAO newsDAO = new NewsDAO();

                // Call the getAllNews method to fetch all news articles
                List<News> newsList = newsDAO.getAllNews();

                // Check if there are any news articles
                if (newsList != null && !newsList.isEmpty()) {
                    // Iterate through the list of news articles
                    for (News news : newsList) {
            %>
            <!-- Use the data from the 'news' object to display news information -->
            <div class="col-md-6 col-xl-4 col-sm-12 d-flex">
                <div class="blog grid-blog flex-fill">
                    <div class="blog-content">
                        <h3 class="blog-title"><a href="#" data-bs-toggle="modal" data-bs-target="#news_detail<%= news.getNewsID()%>"><%= news.getTitle()%></a></h3>
                        <p><%= news.getContent()%></p>
                        <p>Create at: <%= news.getCreateAt()%></p>
                        <p>Create by: <%= news.getAdminProfileID()%></p>
                    </div>
                </div>
            </div>

            <div class="modal custom-modal fade" id="news_detail<%= news.getNewsID()%>" aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">
                            <h3><%=news.getTitle()%></h3>
                            <div class="form-header">
                                <p><%=news.getContent()%></p>
                            </div>
                            <div class="modal-btn delete-action">
                                <div class="row">
                                    <div class="text-center sorting">
                                        <a href="javascript:void(0);" data-bs-dismiss="modal" class="btn btn-primary paid-cancel-btn">Cancel</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <p>No news articles found.</p>
            <%
                }
            %>
        </div>

    </div>
</div>