<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
  <#if section = "header">
    <!-- Header -->
  <#elseif section = "form">
    <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
      <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
        <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
        <input type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName" value="${(register.formData.firstName!'')}" />
      </div>

      <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
        <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
        <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName" value="${(register.formData.lastName!'')}" />
      </div>

      <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
        <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
        <input type="text" id="email" class="${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" autocomplete="email" />
      </div>

      <#if !realm.registrationEmailAsUsername>
        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
          <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
          <input type="text" id="username" class="${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" autocomplete="username" />
        </div>
      </#if>

      <#if passwordRequired??>
        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
          <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
          <input type="password" id="password" class="${properties.kcInputClass!}" name="password" autocomplete="new-password"/>
        </div>

        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
          <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
          <input type="password" id="password-confirm" class="${properties.kcInputClass!}" name="password-confirm" />
        </div>
      </#if>

      <#if recaptchaRequired??>
        <div class="form-group">
          <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
        </div>
      </#if>

      <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
        <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
          <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
        </div>
      </div>
      
      <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
      </div>
    </form>
  </#if>
</@layout.registrationLayout>
