<div class="image">
    {*{module name="classifieds" function="display_quick_view_button" listing=$listing}*}
    <a class="listingimgurl" href="{$listingUrl}" title='{$listing|cat:""|strip_tags:false}'>
        {if $listing.pictures.numberOfItems > 0}
            {listing_image pictureInfo=$listing.pictures.collection.0 alt="Listing #"|cat:$listing.id class="img-responsive"}
        {else}
            <img src="{url file='main^no_image_available_big.png'}"
                 alt="[[No photos:raw]]" class="noImageAvailable"/>
        {/if}

        {if $listing.AutoSold.exists && $listing.AutoSold.isTrue}
            <div class="soldLabel overlay top left"><span>[[SOLD]]</span></div>
        {elseif $listing.urgent.exists && $listing.urgent.isTrue}
            <div class="soldLabel overlay top left"><span>[[Urgent]]</span></div>
        {/if}
    </a>
</div>
{if $listing.Video.uploaded}
    <div class="videoLable"><span>[[Video]]</span></div>
{/if}