<!DOCTYPE html>
<html lang="{i18n->getCurrentLanguage}">
{include file="main^page_parts/html_head.tpl"}
<body class="colorize-main {foreach from=$GLOBALS.themeInheritanceBranch item=theme} {$theme->getName()} {/foreach}">
{include file="miscellaneous^check_js_cookies.tpl"}
{module name='main' function='display_body_top_templates' do_not_modify_meta_data=true}

{include file="main^page_parts/header_block.tpl"}
{block name="mainContent"}
    <div class="container">
        {$MAIN_CONTENT}
        {include file="main^page_parts/go_top.tpl"}
    </div>
{/block}

{include file="main^page_parts/footer_block.tpl"}
{module name='main' function='display_body_bottom_templates' do_not_modify_meta_data=true}
{include file="users^jivosite_module.tpl"}
</body>
</html>