<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false displayInfo=true; section>
  <#if section = "header">
    <!-- Header -->
  <#elseif section = "form">
    <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
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

      <div class="${properties.kcFormGroupClass!}">
        <#if auth?has_content && auth.showUsername()>
          <div class="${properties.kcFormGroupClass!} icon-input">
            <span class="pficon pficon-user form-control-feedback"></span>
            <input type="text"
              id="username"
              name="username"
              class="${properties.kcInputClass!}"
              value="${auth.attemptedUsername}"
              placeholder="${msg("usernameOrEmail")}"
              autofocus />
          </div>
        <#else>
          <div class="${properties.kcFormGroupClass!} icon-input">
            <span class="pficon pficon-user form-control-feedback"></span>
            <input type="text"
              id="username"
              name="username"
              class="${properties.kcInputClass!}"
              placeholder="${msg("usernameOrEmail")}"
              autofocus />
          </div>
        </#if>
      </div>
      <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
        <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
          <div class="${properties.kcFormOptionsWrapperClass!}">
            <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
          </div>
        </div>
      </div>

      <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
      </div>
    </form>
  <#elseif section = "info" >
      ${msg("emailInstruction")}
  </#if>
</@layout.registrationLayout>
