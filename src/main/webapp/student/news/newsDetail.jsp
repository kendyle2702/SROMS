<%@page import="DAOs.NewsDAO"%>
<div class="page-wrapper" style="min-height: 691px;">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">News</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item active">News Detail</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-lg-10 col-xl-9">
                <div class="blog-view">
                    <div class="blog-single-post">
                        <a href="/student/news/view" class="back-btn"><i class="feather-chevron-left"></i> Back</a>
                        <h2 class="card-title text-center">${news.getTitle()}</h2>
                        <div class="blog-info">
                            <div class="post-list">
                                <ul>
                                    <li>
                                        <i style="font-size: 15px;" class="feather-user"> ${name}</i>
                                    </li>
                                    <li style="font-size: 15px;" ><i class="feather-clock"></i> ${news.getCreateAt()}</li>
                                </ul>
                            </div>
                        </div>
                        <div class="blog-content">
                            <p style="font-size: 20px;" >${news.getContent()}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>