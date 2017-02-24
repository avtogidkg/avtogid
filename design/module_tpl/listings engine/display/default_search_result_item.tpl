{capture assign="listingUrl"}{page_path id='listing'}{$listing.id}/{$listing.urlData|replace:' ':'-'|escape:"urlpathinfo"}.html{/capture}
<div class="thumbnail" {if $listing.feature_highlighted.exists && $listing.feature_highlighted.isTrue}style="background-color:{get_custom_setting id='color_for_highlighted_listing' theme=$GLOBALS.current_theme}"{/if}>
    <div class="row">
        {if $GLOBALS.current_page_uri == '/browse/Parts/' || $GLOBALS.current_page_uri == '/browse/Services/'}
            {if $listing.pictures.numberOfItems == 0}
                <div class="col-sm-12 col-xs-12">
                    <div class="caption">
                        <div class="row">
                            <div class="col-sm-11 col-xs-10">
                                <h3 style="margin-top: 0;">
                                    <a href="{$listingUrl}">{$listing|cat:""|strip_tags:false|truncate:160}</a>
                                </h3>
                            </div>
                            <div class="col-sm-1 col-xs-2">
                                {include file=$listingControlsTemplate listingUrl=$listingUrl}
                            </div>
                        </div>
                    </div>
                </div>
            {else}
                <div class="col-sm-3 col-xs-12">
                    {include file="classifieds^listing_display_image.tpl"}
                </div>
                <div class="col-sm-9 col-xs-12">
                    <div class="caption">
                        <div class="row">
                            <div class="col-sm-9 col-xs-10">
                                <h3 style="margin-top: 0">
                                    <a href="{$listingUrl}">{$listing|cat:""|strip_tags:false|truncate:60}</a>
                                </h3>
                            </div>
                            <div class="col-sm-3 col-xs-2">
                                {include file=$listingControlsTemplate listingUrl=$listingUrl}
                            </div>
                        </div>
                        <div class="row listing-item-details">
                            <div class="col-sm-8 col-xs-12">
                                {include file="classifieds^listing_display_detail.tpl"}
                            </div>
                            <div class="col-sm-4 col-xs-12">
                                {include file="classifieds^listing_display_price.tpl"}
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
        {else}
            <div class="col-sm-3 col-xs-12">
                {include file="classifieds^listing_display_image.tpl"}
            </div>
            <div class="col-sm-9 col-xs-12">
                <div class="caption">
                    <div class="row">
                        <div class="col-sm-9 col-xs-10">
                            <h3 style="margin-top: 0">
                                <a href="{$listingUrl}">{$listing|cat:""|strip_tags:false|truncate:60}</a>
                            </h3>
                        </div>
                        <div class="col-sm-3 col-xs-2">
                            {include file=$listingControlsTemplate listingUrl=$listingUrl}
                        </div>
                    </div>
                    <div class="row listing-item-details">
                        <div class="col-sm-8 col-xs-12">
                            {include file="classifieds^listing_display_detail.tpl"}
                        </div>
                        <div class="col-sm-4 col-xs-12">
                            {include file="classifieds^listing_display_price.tpl"}
                        </div>
                    </div>
                </div>
            </div>
        {/if}
    </div>
</div>