<#macro page>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Sweater</title>
        <link rel="stylesheet" href="/static/style.css">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    </head>

    <style>
        *{
            margin: 0;
            padding: 0;
            text-decoration: none;
            font-family: montserrat;
            box-sizing: border-box;
        }

        body{
            min-height: 100vh;
            background-image: linear-gradient(120deg,#3498db,#8e44ad);
        }

        .login-form{
            width: 360px;
            background: #f1f1f1;
            height: 600px;
            padding: 80px 40px;
            border-radius: 10px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
        }

        .login-form h1{
            text-align: center;
            margin-bottom: 60px;
        }

        .txtb{
            border-bottom: 2px solid #adadad;
            position: relative;
            margin: 30px 0;
        }

        .txtb input{
            font-size: 15px;
            color: #333;
            border: none;
            width: 100%;
            outline: none;
            background: none;
            padding: 0 5px;
            height: 40px;
        }

        .txtb span::before{
            content: attr(data-placeholder);
            position: absolute;
            top: 50%;
            left: 5px;
            color: #adadad;
            transform: translateY(-50%);
            z-index: -1;
            transition: .5s;
        }

        .txtb span::after{
            content: '';
            position: absolute;
            width: 0%;
            height: 2px;
            background: linear-gradient(120deg,#3498db,#8e44ad);
            transition: .5s;
        }

        .focus + span::before{
            top: -5px;
        }
        .focus + span::after{
            width: 100%;
        }

        .logbtn{
            display: block;
            width: 100%;
            height: 50px;
            border: none;
            background: linear-gradient(120deg,#3498db,#8e44ad,#3498db);
            background-size: 200%;
            color: #fff;
            outline: none;
            cursor: pointer;
            transition: .5s;
        }

        .logbtn:hover{
            background-position: right;
        }

        .bottom-text{
            margin-top: 60px;
            text-align: center;
            font-size: 13px;
        }
    </style>

    <body>
    <#include "navbar.ftl">
    <div class="container mt-5">
        <#nested>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>

    <script type="text/javascript">
        $(".txtb input").on("focus",function(){
            $(this).addClass("focus");
        });

        $(".txtb input").on("blur",function(){
            if($(this).val() == "")
                $(this).removeClass("focus");
        });

    </script>

    </body>
    </html>
</#macro>