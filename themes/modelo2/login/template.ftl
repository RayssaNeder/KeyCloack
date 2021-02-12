<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>

  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">
    <head>
      <meta charset="utf-8">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <meta name="robots" content="noindex, nofollow">

      <title>${msg("loginTitle",(realm.displayName!''))}</title>
      
      <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />

      <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
      </#if>
      
      <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
          <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
      </#if>
    </head>

    <body>
      <div class="container-fluid">

        <!-- Combo de idiomas para seleção, porém o idioma é alterado automaticamente -->
        <!--
        <header class="${properties.kcFormHeaderClass!}">
          <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
            <div id="kc-locale">
              <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                <div class="kc-dropdown" id="kc-locale-dropdown">
                  <a href="#" id="kc-current-locale-link">${locale.current}</a>
                  <ul>
                      <#list locale.supported as l>
                          <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                      </#list>
                  </ul>
                </div>
              </div>
            </div>
          </#if>
        </header>
        -->

        <div class="login d-flex align-items-center py-5">
          <div class="container">
            <div class="login-form">
              
              <#-- App-initiated actions should not see warning messages about the need to complete the action -->
              <#-- during login.                                                                               -->
              <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                <div class="alert alert-${message.type}">
                  <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                  <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                  <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                  <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                  <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                </div>
              </#if>

              <header class="${properties.kcFormHeaderClass!}">
                <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
                  <#if displayRequiredFields>
                    <div class="${properties.kcContentWrapperClass!}">
                      <div class="${properties.kcLabelWrapperClass!} subtitle">
                        <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                      </div>
                      <div class="col-md-10">
                        <h1 id="kc-page-title"><#nested "header"></h1>
                      </div>
                    </div>
                  <#else>
                    <h1 id="kc-page-title"><#nested "header"></h1>
                  </#if>
                <#else>
                  <#if displayRequiredFields>
                    <div class="${properties.kcContentWrapperClass!}">
                      <div class="${properties.kcLabelWrapperClass!} subtitle">
                        <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                      </div>
                      <div class="col-md-10">
                        <#nested "show-username">
                        <div class="${properties.kcFormGroupClass!}">
                          <div id="kc-username">
                            <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                            <a id="reset-login" href="${url.loginRestartFlowUrl}">
                              <div class="kc-login-tooltip">
                                  <i class="${properties.kcResetFlowIcon!}"></i>
                                  <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                              </div>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>
                  <#else>
                    <#nested "show-username">
                    <div class="${properties.kcFormGroupClass!}">
                      <div id="kc-username">
                        <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                        <a id="reset-login" href="${url.loginRestartFlowUrl}">
                          <div class="kc-login-tooltip">
                            <i class="${properties.kcResetFlowIcon!}"></i>
                            <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                          </div>
                        </a>
                      </div>
                    </div>
                  </#if>
                </#if>
              </header>

              <#nested "form">

              <#if displayInfo>
                <div class="${properties.kcSignUpClass!}">
                  <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                    <#nested "info">
                  </div>
                </div>
              </#if>
            </div>
          </div>
        </div>
      </div>
    </body>
  </html>
</#macro>
