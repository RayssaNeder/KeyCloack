<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>

  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">
    <head>
      <meta charset="utf-8">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <meta name="robots" content="noindex, nofollow">

      <title>${msg("loginTitle",(realm.displayName!''))}</title>
      
      <link rel="icon" href="${properties.urlcdn}/${realm.name}/img/favicon.ico" />

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

       <link href="${properties.urlcdn}/${realm.name}/keycloack/estilo.css" rel="stylesheet" />
    </head>

    <body>
      
      <#nested "header">

      <#nested "form">

    </body>
  </html>
</#macro>