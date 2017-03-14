<div class="row">
    <div class="col-md-9">
        {set_global_parameter key='searchID' value= $listing_search.id}
        {extension_point name='modules\main\apps\FrontEnd\ISearchResultsAdditionDisplayer' listingSearchID = $listing_search.id}
        <div class="listingSearchResultsPage gallery-view">
            {if $listing_search.total_found > 0}
                {capture assign="restore_url"}
                    {$GLOBALS.site_url}{$listing_search.search_results_uri}?action=restore&amp;searchId={$listing_search.id}
                {/capture}
                {include file="search_result_header.tpl" restore_url=$restore_url}

                <div class="row">
                    {foreach from=$listings item=listing name=listings}
                        <div class="col-sm-6 col-md-4">
                            {display_listing listing=$listing listingControlsTemplate="search_result_listing_controls.tpl" listing_search=$listing_search listingTemplate="category_templates/display/gallery_search_result_item.tpl"}
                        </div>
                        {if $listing@iteration is div by 3}<div class="clearfix visible-md visible-lg"></div>{/if}
                        {if $listing@iteration is div by 2}<div class="clearfix visible-sm"></div>{/if}
                    {/foreach}
                </div>

                {include file="page_selector.tpl" current_page=$listing_search.current_page pages_number=$listing_search.pages_number url=$restore_url}
            {else}
                {if !is_null($listing_search.search_form_uri)}
                    {assign var=link value="{$GLOBALS.site_url}{$listing_search.search_form_uri}?action=restore&amp;searchId={$listing_search.id}"}
                    <p class="error">[[There are no listings available that match your search criteria. Please try to <a href="$link">broaden your search criteria</a>.]]</p>
                {else}
                    <p class="error">[[There are no listings available that match your search criteria. Please try to broaden your search criteria.]]</p>
                {/if}
            {/if}
        </div>
        <script type="text/javascript">
            var listingsInComparisonCounter = {$listingsCountInComparison};
        </script>

    </div>
    <div class="col-md-3">
        {module name="classifieds" ignoreFieldIds=$GLOBALS.parameters.browsingFieldIds function="refine_search" search_id=$listing_search.id}
        {include file="menu^menu_accordion_js.tpl"}
        {include file='banners^gas_right_menu.tpl'}
    </div>
</div>
