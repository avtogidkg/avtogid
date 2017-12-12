<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">[[Tags]]</h3>
    </div>
    <div class="panel-body">
        <div class="fieldValue">
            {if $listing.category_sid.value eq 'Auto SUVs'}
                #{$listing.SUVsMakeModel.Make}
                #{$listing.SUVsMakeModel.Model},
                {$listing.Year},
                [[Price]]: {$listing.AutoPrice} сом,
                <b class='contact-data' hidden>[[Phone number]]: {$listing.PhoneNumber}</b>,
                #{$listing.sid},
                https://www.avtogid.kg{$GLOBALS.current_page_uri}
            {/if}
            {if $listing.category_sid.value eq 'Auto Cars'}
                #{$listing.CarMakeModel.CarMake},
                #{$listing.CarMakeModel.CarModel}
                {$listing.Year}
                [[Price]]: {$listing.AutoPrice} сом,
                <b class='contact-data' hidden>[[Phone number]]: {$listing.PhoneNumber}</b>,
                #{$listing.sid}
                https://www.avtogid.kg{$GLOBALS.current_page_uri}
            {/if}
            {if $listing.category_sid.value eq 'Auto WaterTransport'}
                #{$listing.WaterTransportMake.Make},
                #{$listing.WaterTransportCustomModel.Model}
                {$listing.Year}
                [[Price]]: {$listing.AutoPrice} сом,
                <b class='contact-data' hidden>[[Phone number]]: {$listing.PhoneNumber}</b>,
                #{$listing.sid}
                https://www.avtogid.kg{$GLOBALS.current_page_uri}
            {/if}
            {if $listing.category_sid.value eq 'Special Machinery Trucks'}
                #{$listing.TruckType},
                #{$listing.TruckMake},
                #{$listing.TruckCustomModel},
                {$listing.SpecialMachineryYear}
                [[Price]]: {$listing.SpecialMachineryPrice} сом,
                <b class='contact-data' hidden>[[Phone number]]: {$listing.PhoneNumber}</b>,
                #{$listing.sid}
                https://www.avtogid.kg{$GLOBALS.current_page_uri}
            {/if}
            {if $listing.category_sid.value eq 'Special Machinery Buses'}
                #{$listing.BusType},
                #{$listing.BusMake},
                #{$listing.BusCustomModel},
                {$listing.SpecialMachineryYear}
                [[Price]]: {$listing.SpecialMachineryPrice} сом,
                <b class='contact-data' hidden>[[Phone number]]: {$listing.PhoneNumber}</b>,
                #{$listing.sid}
                https://www.avtogid.kg{$GLOBALS.current_page_uri}
            {/if}
            {if $listing.category_sid.value eq 'Special Machinery Minibuses'}
                #{$listing.MinibusMake},
                #{$listing.MinibusCustomModel},
                {$listing.SpecialMachineryYear}
                [[Price]]: {$listing.SpecialMachineryPrice} сом,
                <b class='contact-data' hidden>[[Phone number]]: {$listing.PhoneNumber}</b>,
                #{$listing.sid}
                https://www.avtogid.kg{$GLOBALS.current_page_uri}
            {/if}
            {if $listing.category_sid.value eq 'Special Machinery Construction Machinery'}
                #{$listing.ConstructionMachineryType},
                #{$listing.SpecialMachineryMake},
                #{$listing.ConstructionMachineryModel},
                {$listing.SpecialMachineryYear}
                [[Price]]: {$listing.SpecialMachineryPrice} сом,
                <b class='contact-data' hidden>[[Phone number]]: {$listing.PhoneNumber}</b>,
                #{$listing.sid}
                https://www.avtogid.kg{$GLOBALS.current_page_uri}
            {/if}
            {if $listing.category_sid.value eq 'Special Machinery Farm Machinery'}
                #{$listing.FarmMachineryType},
                #{$listing.FarmMachineryMake},
                #{$listing.FarmMachineryModel},
                {$listing.SpecialMachineryYear}
                [[Price]]: {$listing.SpecialMachineryPrice} сом,
                <b class='contact-data' hidden>[[Phone number]]: {$listing.PhoneNumber}</b>,
                #{$listing.sid}
                https://www.avtogid.kg{$GLOBALS.current_page_uri}
            {/if}
            {if $listing.category_sid.value eq 'Special Machinery Special auto'}
                #{$listing.SpecialAutoType},
                #{$listing.SpecialAutoType},
                #{$listing.SpecialAutoCustomModel},
                {$listing.SpecialMachineryYear}
                [[Price]]: {$listing.SpecialMachineryPrice} сом,
                <b class='contact-data' hidden>[[Phone number]]: {$listing.PhoneNumber}</b>,
                #{$listing.sid}
                https://www.avtogid.kg{$GLOBALS.current_page_uri}
            {/if}
            {if $listing.category_sid.value.Category eq 'Motocycles'}
                #{$listing.MotosyclesMake},
                #{$listing.MotosyclesModel},
                {$listing.MotoYear},
                [[Price]]: {$listing.MotoPrice} сом,
                <b class='contact-data' hidden>[[Phone number]]: {$listing.PhoneNumber}</b>,
                #{$listing.sid}
                https://www.avtogid.kg{$GLOBALS.current_page_uri}
            {/if}
            {*{$listing.category_sid.value.Category}*}
        </div>
    </div>
</div>