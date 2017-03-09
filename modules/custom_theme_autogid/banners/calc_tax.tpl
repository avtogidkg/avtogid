{include file="banners^calc_tax_script.tpl"}
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Расчет госпошлины</h3>
    </div>

    <form id="service-fee" action="#" method="post">
        <select id="p" name="p" class="form-control-calc">
            <option value="1" SELECTED>Переоформление</option>
            <option value="5">Оформление</option>
        </select>
        <p class="form-calc-header">Выберите категорию:</p><div style="overflow: hidden;">
            <select id="s" name="s" class="fee_select form-control-calc" size="4">
                <option value="0">Легковые автомобили</option>
                <option value="1">Автобусы, Микроавтобусы, Грузовые автомобили</option>
                <option value="2">Прицепы и прицепные устройства</option>
                <option value="3">Квадрициклы, Трициклы, Мотоциклы, Скутеры</option>
            </select></div>
        <div id="select-c"></div>
        <div id="select-y"></div>
        <div id="select-v"></div>
        <div id="get-price"></div>

    </form>
</div>