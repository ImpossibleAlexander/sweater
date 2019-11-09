<#macro login path isRegisterForm>
    <form action="${path}" method="post" class="login-form">
        <#if !isRegisterForm>
            <h2 align="center">Welcome</h2>
        <#else>
            <h2 align="center">Registration</h2>
        </#if>
        <div class="txtb">
                <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       />
             <span data-placeholder="Username"></span>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        <div class="txtb">
            <input type="password" name="password" class="form-control ${(passwordError??)?string('is-invalid', '')}" />
            <span data-placeholder="Password"></span>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        <#if isRegisterForm>
                <div class="txtb">
                    <input type="password" name="passwordСonfirmation"
                           class="form-control ${(passwordСonfirmationError??)?string('is-invalid', '')}"/>
                    <span data-placeholder="Retype password"></span>
                    <#if passwordСonfirmationError??>
                        <div class="invalid-feedback">
                            ${passwordСonfirmationError}
                        </div>
                    </#if>
                </div>
            <div class="txtb">
                    <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                           class="form-control ${(emailError??)?string('is-invalid', '')}"
                            />
                    <span data-placeholder="Email"></span>
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            <div  class="form-group row">
                <div class="g-recaptcha" data-sitekey="6LduL7cUAAAAAHXpiUHKkrng-KuYspjvQi5V8kTl"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="logbtn" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
        <#if !isRegisterForm>
            <div class="bottom-text">
                Don't have account? <a href="/registration">Sign up</a>
            </div>
        </#if>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Sign Out</button>
    </form>
</#macro>