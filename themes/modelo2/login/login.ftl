<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=false displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
  <#if section = "header">
    <!-- Header -->
  <#elseif section = "form">
    <#if realm.password>
      <form onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
        <div class="illustration">
          <div class="logo"></div>
        </div>

        <#if message?has_content>
          <div id="login-alert" class="alert alert-${message.type} col-sm-12">
            <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
            <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
            <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
            <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>

            <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
          </div>
        </#if>

        <#if usernameEditDisabled??>
          <div class="${properties.kcFormGroupClass!} icon-input">
            <span class="pficon pficon-user form-control-feedback"></span>
            <input type="text"
              tabindex="1"
              id="username"
              name="username"
              class="${properties.kcInputClass!}"
              value="${(login.username!'')}"
              placeholder="${msg("username")}"
              disabled />
          </div>
        <#else>
          <div class="${properties.kcFormGroupClass!} icon-input">
            <span class="pficon pficon-user form-control-feedback"></span>
            <input type="text"
              tabindex="1"
              id="username"
              name="username"
              class="${properties.kcInputClass!}"
              value="${(login.username!'')}"
              placeholder="${msg("username")}"
              autofocus
              autocomplete="off" />
          </div>
        </#if>

        <div class="${properties.kcFormGroupClass!} icon-input">
          <span class="pficon pficon-key form-control-feedback"></span>
          <input type="password"
            tabindex="2"
            id="password"
            name="password"
            placeholder="${msg("password")}"
            class="${properties.kcInputClass!}"
            autocomplete="off" />
        </div>
        
        <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
           <div id="kc-form-options">
              <#if realm.rememberMe && !usernameEditDisabled??>
                  <div class="checkbox">
                     <label>
                         <#if login.rememberMe??>
                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                         <#else>
                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                         </#if>
                     </label>
                  </div>
              </#if>
           </div>

           <div class="${properties.kcFormOptionsWrapperClass!}">
              <#if realm.resetPasswordAllowed>
                <span>
                  <a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                </span>
              </#if>
           </div>
        </div>

        <div class="${properties.kcFormGroupClass!}">
          <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

          <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
        </div>

        <!-- Login com outros providers (Facebook, AD e etc) -->
        <#if realm.password && social.providers??>
          <div class="row">
            <div class="col"><hr></div>
            <div class="col-auto">ou</div>
            <div class="col"><hr></div>
          </div>

          <div id="kc-social-providers" class="${properties.kcFormSocialAccountClass!}">
            <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
              <#list social.providers as p>
                <li class="${properties.kcFormSocialAccountListLinkClass!}">
                  <a href="${p.loginUrl}" id="zocial-${p.alias}" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}">
                    <span>${p.displayName}</span>
                  </a>
                </li>
              </#list>
            </ul>
          </div>
        </#if>                
      </form>
    </#if>
  <#elseif section = "info" >
    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
      <div id="kc-registration">
        <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
      </div>
    </#if>
  </#if>
</@layout.registrationLayout>