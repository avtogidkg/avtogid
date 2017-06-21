{assign var='excluded_fields' value=['createdAt', 'updatedAt', 'AllowExchange', 'moderComment', 'paymentActions', 'paymentId', 'ups', 'status', 'firstApprove', 'AllowComments', 'IsInPaper', 'SizeInPaper', 'urgent', 'fromPaper', 'AutoSold']}
<div class="form">
    <fieldset>

        <legend>[[Photo]]</legend>
        {module name="classifieds" function="manage_pictures" listing_id=$listing.id}
    </fieldset>
    <fieldset>
        {foreach from=$form_fields item=form_field}
            {if $form_field.id == 'Video'}
                {if $package.video_allowed}
                    {include file="category_templates/input/display_form_field.tpl" id=$form_field.id center=true}
                {/if}
            {elseif $form_field.id == 'PostInTheNewspaper'}
                {include file="category_templates/input/display_form_field.tpl" id=$form_field.id center=true template='checkbox_form_field.tpl'}
            {elseif $form_field.id == 'AutoSold' and $display_sold_field}
                {include file="category_templates/input/display_form_field.tpl" id=$form_field.id center=true template='checkbox_form_field.tpl'}
            {elseif $form_field.id != 'ListingRating' and !in_array($form_field.id, $excluded_fields)}
                {include file="category_templates/input/display_form_field.tpl" id=$form_field.id center=true}
            {/if}
        {/foreach}
    </fieldset>


</div>
