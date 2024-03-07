
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<title>Student Relation Office Management System</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
<style type="text/css">@font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:400;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/400/normal.woff2);
        unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:400;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/400/normal.woff2);
        unicode-range:U+0370-03FF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:400;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/400/normal.woff2);
        unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:400;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/400/normal.woff2);
        unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:400;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/400/normal.woff2);
        unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:400;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/400/normal.woff2);
        unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:400;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/400/normal.woff2);
        unicode-range:U+1F00-1FFF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:500;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/500/normal.woff2);
        unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:500;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/500/normal.woff2);
        unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:500;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/500/normal.woff2);
        unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:500;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/500/normal.woff2);
        unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:500;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/500/normal.woff2);
        unicode-range:U+1F00-1FFF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:500;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/500/normal.woff2);
        unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:500;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/500/normal.woff2);
        unicode-range:U+0370-03FF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:700;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/700/normal.woff2);
        unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:700;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/700/normal.woff2);
        unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:700;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/700/normal.woff2);
        unicode-range:U+0370-03FF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:700;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/700/normal.woff2);
        unicode-range:U+1F00-1FFF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:700;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/700/normal.woff2);
        unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:700;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/700/normal.woff2);
        unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:700;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/700/normal.woff2);
        unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:900;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/900/normal.woff2);
        unicode-range:U+1F00-1FFF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:900;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/900/normal.woff2);
        unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:900;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/900/normal.woff2);
        unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:900;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/900/normal.woff2);
        unicode-range:U+0370-03FF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:900;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/900/normal.woff2);
        unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:900;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/900/normal.woff2);
        unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:normal;
        font-weight:900;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/900/normal.woff2);
        unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:400;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/400/italic.woff2);
        unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:400;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/400/italic.woff2);
        unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:400;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/400/italic.woff2);
        unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:400;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/400/italic.woff2);
        unicode-range:U+0370-03FF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:400;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/400/italic.woff2);
        unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:400;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/400/italic.woff2);
        unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:400;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/400/italic.woff2);
        unicode-range:U+1F00-1FFF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:500;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/500/italic.woff2);
        unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:500;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/500/italic.woff2);
        unicode-range:U+1F00-1FFF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:500;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/500/italic.woff2);
        unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:500;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/500/italic.woff2);
        unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:500;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/500/italic.woff2);
        unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:500;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/500/italic.woff2);
        unicode-range:U+0370-03FF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:500;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/500/italic.woff2);
        unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:700;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/700/italic.woff2);
        unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:700;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/700/italic.woff2);
        unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:700;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/700/italic.woff2);
        unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:700;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/700/italic.woff2);
        unicode-range:U+0370-03FF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:700;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/700/italic.woff2);
        unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:700;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/700/italic.woff2);
        unicode-range:U+1F00-1FFF;
        font-display:swap;
    }
    @font-face {
        font-family:Roboto;
        font-style:italic;
        font-weight:700;
        src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/700/italic.woff2);
        unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
        font-display:swap;
    }</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/feather/feather.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/icons/flags/flags.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/simple-calendar/simple-calendar.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
