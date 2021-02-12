<#import "template.ftl" as layout>

<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        <!-- Header -->
    <#elseif section = "form">
        <#if realm.password>
            <div class="container-fluid">
               <div class="row no-gutter">
                  <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
                  <div class="col-md-8 col-lg-6">
                     <div class="login d-flex align-items-center py-5">
                        <div class="container">
                           <div class="row">
                              <div class="col-md-9 col-lg-8 mx-auto">
                                 <div id="logo-login">
                                    <div id="logo"></div>
                                 </div>
                                 
                                 <h3 class="login-heading mb-4 bem-vindo">Seja bem vindo!</h3>
                                 
                                 <form onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
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
                                        <div class="form-label-group">
                                           <input type="text"
                                              tabindex="1"
                                              id="username"
                                              name="username"
                                              class="${properties.kcInputClass!}"
                                              value="${(login.username!'')}"
                                              disabled />

                                           <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>                                        
                                        </div>
                                    <#else>
                                        <div class="form-label-group">
                                           <input type="text"
                                              tabindex="1"
                                              id="username"
                                              name="username"
                                              class="${properties.kcInputClass!}"
                                              value="${(login.username!'')}"
                                              autofocus
                                              autocomplete="off" />

                                           <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>                                        
                                        </div>
                                    </#if>

                                    <div class="${properties.kcFormGroupClass!}">
                                       <div class="form-label-group">
                                           <input type="password"
                                              tabindex="2"
                                              id="password"
                                              name="password"
                                              class="${properties.kcInputClass!}"
                                              autocomplete="off" />

                                           <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                                       </div>
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

                                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                                       <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

                                       <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                                    </div>
                                 </form>

                                 <#if realm.password && social.providers??>
                                     <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                                        <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                                           <#list social.providers as p>
                                                <li class="${properties.kcFormSocialAccountListLinkClass!}">
                                                    <a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}">
                                                        <span>${p.displayName}</span>
                                                    </a>
                                                </li>
                                           </#list>
                                        </ul>
                                     </div>
                                 </#if>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>