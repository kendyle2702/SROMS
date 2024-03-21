<%@page import="javafx.scene.layout.Border"%>
<%@page import="Models.News"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.NewsDAO"%>

<style>
    .blog{
        border-radius: 10px;
        margin-bottom: 10px;
    }
</style>

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
            <div class="col-md-8 col-xl-12 col-sm-8">
                <div class="blog grid-blog flex-fill">
                    <a href="/eventmanager/news/view/detail/<%=news.getNewsID()%>">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3  style="color: black" class="blog-title">
                                    <%= news.getTitle()%> 
                                </h3>
                            </div>
                            <div class="col-4 text-end">
                                Create date: <%= news.getCreateAt()%>
                            </div>
                        </div>
                    </a>
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