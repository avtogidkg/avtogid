<script type="text/javascript" src="{$GLOBALS.site_url}/vendor/form_validation/listing_add_validation.js"></script>
<script type="text/javascript" src="{url file='custom_listing_feature_ads_in_newspaper^newsPaperAdsHelper.js'}"></script>
{include file="miscellaneous^dialog_window.tpl"}

<script type="text/javascript ">
    $(document).ready(function () {
        $("form[name='addListing'] :input").change(function() {
            $("form[name='addListing']").data('changed', true);
        });
        $("ul.steps a, input[name='action_back']").click(function () {
            var flagOfChanges = false;{* The future’s in the air, I can feel it everywhere blowing with the flag of change… *}
            if(typeof CKEDITOR !== 'undefined')
            {
                for (var i in CKEDITOR.instances)
                {
                    if ((flagOfChanges = CKEDITOR.instances[i].checkDirty()) === true)
                    {
                        break;
                    }
                }
            }
            if ($("form[name='addListing']").data('changed') || flagOfChanges)
            {
                return confirm('[[Are you sure you want to go back?\nIf you do, you will lose all unsaved information added on this step.\nPress "Save & Continue", and then try again.:raw]]');
            }
        });
        $("form[name='addListing']").submit(validate_listing_add_form);
    });
</script>
<div class="listingFormContainer">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="thumbnail listingFormContainer">
                <div class="stepsWrap text-center">
                    <ul class="nav nav-tabs nav-justified" role="tablist">
                        {foreach $steps as $step}
                            {if $step.current}
                                {$class='active'}
                            {elseif $step@iteration > $maxReachedStepsCount}
                                {$class='disabled'}
                            {elseif $step@iteration <= $maxReachedStepsCount}
                                {$class='enable'}
                            {else}
                                {$class=''}
                            {/if}

                            <li class="{$class}">

                                <div class="visible-lg-block text-center stepLine {if $step@first}first{/if}{if $step@last} last{/if}">
                                    <span class="badge {$class}">{$step@iteration}</span>
                                    {if $step@first}<div class="firstStep"></div>{/if}
                                    {if $step@last}<div class="lastStep"></div>{/if}
                                    {if !$step@last && $step@iteration >= $maxReachedStepsCount}<div class="enableStep"></div>{/if}
                                </div>
                                {if $step@iteration <= $maxReachedStepsCount && !$step.current}
                                    <a href="?action_go_to_step=1&amp;step={$step@iteration}&amp;add_listing_session_id={$add_listing_session_id}">[[$step.title]]</a>
                                {else}
                                    <a href="#">[[$step.title]]</a>
                                {/if}
                            </li>
                        {/foreach}
                    </ul>
                </div>
                {display_error_messages}

                <div class="alert alert-warning">
                    <div class="form-horizontal row text-center">
                        <div class="col-xs-12">
                            <a class="btn btn-primary" href="{page_path module='classifieds' function='fill_listing_form'}?action=search&category_id={$categoryId}&add_listing_session_id={$add_listing_session_id}"
                               onclick="return openDialogWindow('[[Choose a Listing as a Template]]', this.href, 900, true)">
                                [[Сreate a new ad based on an existing listing]]
                            </a>
                        </div>
                    </div>
                    <div class="form-horizontal row text-center margin-top-20">
                        <div class="col-xs-12">
                            <small>
                                [[Fields marked with an asterisk (<span class="asterisk">*</span>) are mandatory]]
                            </small>
                        </div>
                    </div>
                </div>

                <form method="post" action="" enctype="multipart/form-data" id="{$id}" name="addListing" class="form-horizontal">
                    <div>
                        <input type="hidden" name="step" value="{$currentStep}"/>
                        <input type="hidden" name="add_listing_session_id" value="{$add_listing_session_id}"/>
                        {$formContent}
                        {if $stepIsLast}
                            {module name="listing_repost" function="display_add_listing_settings"}
                            <fieldset>
                                <legend>[[Listing Features]]</legend>
                                {if array_diff_assoc($freeFeatures, $newsPaperFeatures)|count > 0}
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <div class="alert alert-warning text-center">[[Enable free listing features]]:</div>
                                            <div class="row">
                                                {foreach from=$freeFeatures item=feature}
                                                    {if not in_array($feature.id, array_keys($newsPaperFeatures))}
                                                        <div class="col-xs-6 col-sm-4">
                                                            <div class="checkbox text-left">
                                                                <label>
                                                                    <input type="checkbox" name="selectedOptionIds[]" value="{$feature.id}" {if in_array($feature.id, $selectedOptionIds)}checked="checked"{/if} />
                                                                    [[$feature.caption]]
                                                                </label>
                                                            </div>
                                                        </div>
                                                    {/if}
                                                {/foreach}
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                                {if array_diff_assoc($paidFeatures, $newsPaperFeatures)|count > 0}
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <div class="alert alert-warning text-center">[[Enable paid listing features:]]</div>
                                            <div class="row">
                                                {foreach from=$paidFeatures item=feature}
                                                    {if not in_array($feature.id, array_keys($newsPaperFeatures))}
                                                        <div class="col-xs-6 col-sm-4">
                                                            <div class="checkbox text-left">
                                                                <label>
                                                                    <input type="checkbox" name="selectedOptionIds[]" value="{$feature.id}" {if in_array($feature.id, $selectedOptionIds)}checked="checked"{/if} />
                                                                    [[$feature.caption]]
                                                                    <p>{display_price_with_currency amount=$feature.price}</p>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    {/if}
                                                {/foreach}
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                                {if $newsPaperFeatures|count > 0}
                                    <div class="form-group newspaper-ads hidden">
                                        <div class="col-sm-12">
                                            <div class="alert alert-warning text-center">
                                                [[Enable ads in newspaper]]
                                                <p>
                                                    {$nextNewsPaperIssueDate = $nextNewsPaperIssueDate|date_format: '%d/%m/%Y'}
                                                    [[This ad will automatically be submitted for publication in the newspaper "AVTOgid" dated <strong>$nextNewsPaperIssueDate</strong>]]
                                                </p>
                                            </div>
                                            <div id="ads-type" class="alert alert-warning text-center">
                                                <p>
                                                    [[Select the type of ads in the newspaper]] <span class="asterisk">*</span>
                                                </p>
                                            </div>
                                            <div class="row">
                                                {foreach from=$newsPaperFeatures item=feature}
                                                    {if isset($feature.excluded) and $feature.excluded eq true}
                                                        {include file=$feature.template}
                                                    {/if}
                                                {/foreach}
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                            </fieldset>
                        {/if}
                        <div class="formConrols text-center">
                            {if !$stepIsFirst}
                                <button type="submit" class="btn btn-primary" name="action_back" value="1">[[Go Back:raw]]</button>
                            {/if}

                            {if !$stepIsLast}
                                <button type="submit" class="btn btn-primary" name="action_forward" value="1">[[Save & Continue:raw]]</button>
                            {else}
                                <button type="submit" class="btn btn-primary" name="action_add" value="1">[[Save Listing:raw]]</button>
                            {/if}
                        </div>
                    </div>
                </form>
            </div>
            <script type="text/javascript" src="{url file="field_types^showInputError.js"}"></script>
        </div>
    </div>
</div>