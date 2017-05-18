{if $listing.AutoPrice.exists and !$listing.AutoPrice.isEmpty}
    {assign var='ListingPrice' value=$listing.AutoPrice}
{elseif $listing.PartPrice.exists and !$listing.PartPrice.isEmpty}
    {assign var='ListingPrice' value=$listing.PartPrice}
{elseif $listing.BuyPrice.exists and !$listing.BuyPrice.isEmpty}
    {assign var='ListingPrice' value=$listing.BuyPrice}
{else}
    {assign var='ListingPrice' value=''}
{/if}
{if $ListingPrice!=''}
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-6">
            <p class="price-name">[[Цена]]</p>
            <p class="price">
                <span class="fieldValue fieldValueAutoPrice money">[[{$ListingPrice}]]
                    {$GLOBALS.custom_settings.listing_currency}</span>
            </p>
        </div>
        {assign var='carAge' value='Y'|date - $listing.Year.value}
        {if $listing.category_sid.value eq 'Auto Cars' or $listing.category_sid.value eq 'Auto SUVs'}
            {if $GLOBALS.settings.credit_bank_max_car_age gt $carAge}
                <div class="col-md-12 col-sm-12 col-xs-6">
                    <p class="price-name price-name-cred">[[В кредит]]</p>
                    <p class="price price-cred" data-listing-sid="{$listing.sid}" data-price="{$ListingPrice}">
                            <span class="fieldValue fieldValueAutoPrice money">{{calc_credit_monthly_payment price={$ListingPrice}}|round}
                                {$GLOBALS.custom_settings.listing_currency}{$listing.category_sid.value.Category}</span>
                    </p>
                </div>
            {/if}
        {/if}
    </div>
{/if}