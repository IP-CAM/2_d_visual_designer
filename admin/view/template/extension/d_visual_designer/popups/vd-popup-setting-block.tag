<vd-popup-setting-block>
<div class="vd vd-popup-overlay" if={this.status}></div>
<div class="vd vd-popup {classPopup} {stick_left? 'stick-left':''}" if={this.status} style="max-height:75vh;">
    <div class="popup-header">
        <h2 class="title">{block_config.title} {store.getLocal('designer.text_edit_block')}</h2>
        <a class="close" onClick={close}><i class="fal fa-times"></i></a>
    </div>
    <div class="popup-tabs">
        <ul class="vd-nav">
            <li class="active"><a href="#tab-edit-block" data-toggle="tab"><formatted-message path='designer.tab_general'/></a></li>
            <li><a href="#tab-design-block" data-toggle="tab"><formatted-message path='designer.tab_design'/></a></li>
            <li><a href="#tab-css-block" data-toggle="tab"><formatted-message path='designer.tab_css'/></a></li>
        </ul>
    </div>
    <div class="popup-content">
        <div class="tab-content body">
            <div class="tab-pane active" id="tab-edit-block">
                <div data-is='vd-setting-block-{block_type}' block={block_info} ></div>
            </div>
            <div class="tab-pane" id="tab-design-block">
                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_margin')}</label>
                    <div class="fg-setting">
                        <div class=wrap-setting>
                            <input type="text" name="design_margin_top" class="form-control pixels-procent" value="{setting.global.design_margin_top}" onChange={change}>
                            <span class="label-helper">{store.getLocal('designer.text_top')}</span>
                        </div>
                        <div class="wrap-setting">
                            <input type="text" name="design_margin_right" class="form-control pixels-procent" value="{setting.global.design_margin_right}" onChange={change}>
                            <span class="label-helper">{store.getLocal('designer.text_right')}</span>
                        </div>
                        <div class="wrap-setting">
                            <input type="text" name="design_margin_bottom" class="form-control pixels-procent" value="{setting.global.design_margin_bottom}" onChange={change}>
                            <span class="label-helper">{store.getLocal('designer.text_bottom')}</span>
                        </div>
                        <div class="wrap-setting">
                            <input type="text" name="design_margin_left" class="form-control pixels-procent" value="{setting.global.design_margin_left}" onChange={change}>
                            <span class="label-helper">{store.getLocal('designer.text_left')}</span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_padding')}</label>
                    <div class="fg-setting">
                        <div class="wrap-setting">
                            <input type="text" name="design_padding_top" class="form-control pixels-procent" value="{setting.global.design_padding_top}" onChange={change}>
                            <span class="label-helper">{store.getLocal('designer.text_top')}</span>
                        </div>
                        <div class="wrap-setting">
                            <input type="text" name="design_padding_right" class="form-control pixels-procent" value="{setting.global.design_padding_right}" onChange={change}>
                            <span class="label-helper">{store.getLocal('designer.text_right')}</span>
                        </div>
                        <div class="wrap-setting">
                            <input type="text" name="design_padding_bottom" class="form-control pixels-procent" value="{setting.global.design_padding_bottom}" onChange={change}>
                            <span class="label-helper">{store.getLocal('designer.text_bottom')}</span>
                        </div>
                        <div class="wrap-setting">
                            <input type="text" name="design_padding_left" class="form-control pixels-procent" value="{setting.global.design_padding_left}" onChange={change}>
                            <span class="label-helper">{store.getLocal('designer.text_left')}</span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_border')}</label>
                    <div class="fg-setting">
                        <div class="wrap-setting">
                            <input type="text" name="design_border_top" class="form-control pixels-procent" value="{setting.global.design_border_top}" onChange={change}>
                            <span class="label-helper">{store.getLocal('designer.text_top')}</span>
                        </div>
                        <div class="wrap-setting">
                            <input type="text" name="design_border_right" class="form-control pixels-procent" value="{setting.global.design_border_right}" onChange={change}>
                            <span class="label-helper">{store.getLocal('designer.text_right')}</span>
                        </div>
                        <div class="wrap-setting">
                            <input type="text" name="design_border_bottom" class="form-control pixels-procent" value="{setting.global.design_border_bottom}" onChange={change}>
                            <span class="label-helper">{store.getLocal('designer.text_bottom')}</span>
                        </div>
                        <div class="wrap-setting">
                            <input type="text" name="design_border_left" class="form-control pixels-procent" value="{setting.global.design_border_left}" onChange={change}>
                            <span class="label-helper">{store.getLocal('designer.text_left')}</span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_border_color')}</label>
                    <div class="fg-setting">
                        <vd-color-picker name={'design_border_color'} value={setting.global.design_border_color} evchange={change}/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_border_style')}</label>
                    <div class="fg-setting">
                        <select name="design_border_style" class="form-control"  onChange={change}>
                            <option each={value, key in store.getOptions('designer.border_styles')} value="{key}" selected={setting.global.design_border_style == key}>{value}</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_border_radius')}</label>
                    <div class="fg-setting">
                        <input type="text" name="design_border_radius" class="form-control pixels" value="{setting.global.design_border_radius}" onChange={change}>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_animate')}</label>
                    <div class="fg-setting">
                        <select name="design_animate" class="form-control" onChange={change}>
                            <option each={value, key in store.getOptions('designer.animates')} value="{key}" selected={setting.global.design_animate == key}>{value}</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_show_on')}</label>
                    <div class="fg-setting">
                        <label class="vd-checkbox">
                            <input type="checkbox" name="design_show_on" value="show_mobile" checked={_.contains(setting.global.design_show_on, 'show_mobile')} onChange={change}> {store.getLocal('designer.text_phone')}
                        </label>
                        <br>
                        <label class="vd-checkbox">
                            <input type="checkbox" name="design_show_on" value="show_tablet" checked={_.contains(setting.global.design_show_on, 'show_tablet')} onChange={change}> {store.getLocal('designer.text_tablet')}
                        </label>
                        <br>
                        <label class="vd-checkbox">
                            <input type="checkbox" name="design_show_on" value="show_desktop" checked={_.contains(setting.global.design_show_on, 'show_desktop')} onChange={change}> {store.getLocal('designer.text_desktop')}
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_image')}</label>
                    <div class="fg-setting">
                        <a href="" id="thumb-vd-image" data-toggle="vd-image" class="img-thumbnail">
                            <img src="{setting.edit.design_background_thumb}" alt="" title="" data-placeholder="{store.getOptions('designer.placeholder')}" width="100px" height="100px" />
                        </a>
                        <input type="hidden" name="design_background_image" value="{setting.global.design_background_image}" id="input-vd-image" onChange={change} />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_image_style')}</label>
                    <div class="fg-setting">
                        <select name="design_background_image_style" class="form-control" onChange={change}>
                            <option each={value, key in store.getOptions('designer.image_styles')} value="{key}" selected={setting.global.design_background_image_style == key}>{value}</option>
                        </select>
                    </div>
                </div>
                <div class="form-group" hide={setting.global.design_background_image_style == 'parallax'}>
                    <label class="control-label">{store.getLocal('designer.entry_image_position')}</label>
                    <div class="fg-setting">
                        <div class="wrap-setting wrap-50">
                            <select name="design_background_image_position_horizontal" class="form-control" onChange={change}>
                                    <option each={value, key in store.getOptions('designer.image_horizontal_positions')} value="{key}" selected={setting.global.design_background_image_position_horizontal == key}>{value}</option>
                            </select>
                            <span class="label-helper">{store.getLocal('designer.text_horizontal')}</span>
                        </div>
                        <div class="wrap-setting wrap-50">
                            <select name="design_background_image_position_vertical" class="form-control" onChange={change}>
                                <option each={value, key in store.getOptions('designer.image_vertical_positions')} value="{key}" selected={setting.global.design_background_image_position_vertical == key}>{value}</option>
                            </select>
                            <span class="label-helper">{store.getLocal('designer.text_vertical')}</span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_background')}</label>
                    <div class="fg-setting">
                        <vd-color-picker name={'design_background'} value={setting.global.design_background} evchange={change}/>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="tab-css-block">
                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_id')}</label>
                    <div class="fg-setting">
                        <input type="text" name="id" class="form-control"  value="{setting.global.id}" onchange={change}/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_additional_css_class')}</label>
                    <div class="fg-setting">
                        <input type="text" name="additional_css_class" class="form-control" value="{setting.global.additional_css_class}" onChange={change}>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_additional_css_before')}</label>
                    <div class="fg-setting">
                        <textarea name="additional_css_before" class="form-control" onChange={change}>{setting.global.additional_css_before}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_additional_css_content')}</label>
                    <div class="fg-setting">
                        <textarea name="additional_css_content" class="form-control" onChange={change}>{setting.global.additional_css_content}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">{store.getLocal('designer.entry_additional_css_after')}</label>
                    <div class="fg-setting">
                        <textarea name="additional_css_after" class="form-control" onChange={change}>{setting.global.additional_css_after}</textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <div class="popup-footer">
        <div class="vd-btn-group btn-4">
            <a class="vd-btn cancel" onClick={cancel}><i class="fas fa-times"></i></a>
            <a class="vd-btn undo" onClick={undoHistory}><i class="fas fa-undo-alt"></i></a>
            <a class="vd-btn return" onClick={returnHistory}><i class="fas fa-redo-alt"></i></a>
            <a class="vd-btn apply" onClick={save}><i class="fas fa-check"></i></a>
        </div>
    </div>
    <image-manager/>
</div>
<script>
    this.mixin({store:d_visual_designer})
    this.status = false
    this.block_id = ''
    this.classPopup = ''
    this.block_type = ''
    this.width = ''
    this.height = ''
    this.left = ''
    this.top = ''
    this.designer_id = this.parent.opts.id
    this.block_config = _.find(this.store.getState().config.blocks, function(block){
        return block.type == this.block_type
    }.bind(this))
    this.block_info = ''
    this.previewColorChange = 0

    save(e){
        this.store.dispatch('block/setting/update', {block_id: this.block_id, designer_id: this.designer_id})
        this.status = false;
        this.block_id = '';
        this.block_type = '';
        this.update();
    }.bind(this)

    undoHistory(e) {
        this.store.dispatch('history/undo', {block_id: this.block_id, designer_id: this.designer_id, fast: true})
    }.bind(this)

    returnHistory(e) {
        this.store.dispatch('history/return', {block_id: this.block_id, designer_id: this.designer_id})
    }.bind(this)

    this.store.subscribe('block/create/success', function(data){
        if(data.designer_id == this.designer_id) {
            this.block_id = data.block_id
            this.block_type = data.type
            this.initSetting()
            this.status = true
            this.update();
        }
    }.bind(this))

    this.store.subscribe('block/setting/begin', function(data){
        if(data.designer_id == this.designer_id) {
            this.block_id = data.block_id
            this.block_type = data.type
            this.initSetting()
            this.status = true
            this.update()
        }
    }.bind(this))

    this.initSetting = function() {
        if(this.block_type && this.block_id) {
            this.block_config = _.find(this.store.getState().config.blocks, function(block){
                return block.type == this.block_type
            }.bind(this))
            this.block_info = this.store.getState().blocks[this.designer_id][this.block_id]
            this.block_info.id = this.block_id
            if( this.block_info.parent == ''){
                this.classPopup = 'main'
            } else if (this.block_config.setting.child_blocks) {
                this.classPopup = 'inner'
            } else {
                this.classPopup = 'child'
            }
            this.setting = this.store.getState().blocks[this.designer_id][this.block_id].setting
        }
    }.bind(this)

    this.initPopup = function() {
        $('.vd-popup', this.root).resizable({
            resize: function(event, ui) {
                if(!$('.vd-popup', this.root).hasClass('drag')){
                    $('.vd-popup', this.root).addClass('drag')
                }
                
                $('.vd-popup', this.root).css({ 'max-height': '' });
            }.bind(this),
            stop: function( event, ui ) {
                this.width = ui.size.width;
                this.height = ui.size.height;
            }.bind(this)
        });
        $('.vd-popup', this.root).draggable({
            handle: '.popup-header',
            drag: function(event, ui) {
                if (!ui.helper.hasClass('drag')) {
                    ui.helper.addClass('drag');
                }
            },
            stop: function(event, ui) {
                if (ui.position.top < 0) {
                    ui.helper.css({ 'top': '10px' });
                }
                var height = $(window).height();
                if ((ui.position.top + 100) > height) {
                    ui.helper.css({ 'top': (height - 100) + 'px' });
                }
                this.left = ui.position.left
                this.top = ui.position.top
            }.bind(this)
        });
        if (this.left != '' && this.top != '') {
            $('.vd-popup', this.root).addClass('drag');
            $('.vd-popup', this.root).css({ 'left': this.left, 'top': this.top });
        }
        if (this.width != '' && this.height != '') {
            $('.vd-popup', this.root).css({ 'width': this.width, 'height': this.height });
        }
        $('.vd-popup', this.root).css({ visibility: 'visible', opacity: 1 });
    }.bind(this)

    this.on('mount', function(){
        $(this.root).on('change', 'input.pixels-procent', function(){
            var value = $(this).val();
            var er = /^-?[0-9]+$/;
            var er2 = /^-?[0-9]+(px|%)$/;

            if(er.test(value)){
                this.value = value+'px'
                var event = new Event('change');
                this.dispatchEvent(event);
            }
            else if(!er2.test(value)){
                $(this).val('');
                var event = new Event('change');
                this.dispatchEvent(event);
            }
        });
        $(this.root).on('change', 'input.pixels', function(){
            var value = $(this).val();
            var er = /^-?[0-9]+$/;
            var er2 = /^-?[0-9]+px$/;

            if(er.test(value)){
                this.value = value+'px'
                var event = new Event('change');
                this.dispatchEvent(event);
            }
            else if(!er2.test(value)){
                $(this).val('');
                var event = new Event('change');
                this.dispatchEvent(event);
            }
        });
    })

    this.on('update', function(){
        this.initSetting()
    })
    this.on('updated', function(){
        
        if(this.status) {
            this.initPopup()
        }
    })

    change(e){
        if(e.target.type == 'checkbox'){
            var values = _.values(this.block_info.setting.global[e.target.name])
            if(e.target.checked) {
                values.push(e.target.value)
            } else {
                values = _.filter(values, function(name) {
                    return name != e.target.value
                })
            }
            this.block_info.setting.global[e.target.name] = _.extend({}, values)
        } else {
            this.block_info.setting.global[e.target.name] = e.target.value
        }
        this.store.dispatch('block/setting/fastUpdate', {designer_id: this.designer_id, block_id: this.block_id, setting: this.block_info.setting})
    }

    cancel() {
        this.store.dispatch('history/undo', {block_id: this.block_id, designer_id: this.designer_id, fast: false})
        this.status = false
        this.block_id = ''
        this.block_type = ''
    }

    close() {
        this.status = false
        this.block_id = ''
        this.block_type = ''
    }
</script>
</vd-popup-setting-block>