<visual-designer>
    <div class="vd mode_switch btn-group" role="group">
        <a id="button_classic" class="btn btn-default" hide={store.getState().config.mode[opts.id] == 'classic'} onClick={modeClassic}><formatted-message path='designer.text_classic_mode'/></a>
        <a id="button_vd" class="btn btn-default" hide={!store.getState().config.mode[opts.id] || store.getState().config.mode[opts.id] == 'designer'} onClick={modeDesigner}><formatted-message path='designer.text_backend_editor'/></a>
        <a id="button_frontend" class="btn btn-default" onClick={frontend} if={store.getState().config.route_info.frontend_status && store.getState().config.id}><formatted-message path='designer.text_frontend_editor'/></a>
    </div>
    <div class="content vd" hide={store.getState().config.mode[opts.id] == 'classic'}>
        <div class="row" id="d_visual_designer_nav">
            <div class="pull-left">
                <a id="button_add" class="btn btn-default" onClick={addBlock}></a>
                <a id="button_template" class="btn btn-default" onClick={addTemplate}></a>
                <a id="button_save_template" class="btn btn-default" onClick={saveTemplate}></a>
            </div>
            <div class="pull-right">
                <a id="button_code_view" class="btn btn-default" onClick={codeView}></a>
                <a id="button_full_screen" class="btn btn-default" onclick={fullscreen}></a>
            </div>
        </div>
        <div class="vd-designer" id="sortable"><virtual data-is="wrapper-blocks" selector={"#"+top.opts.id+" #sortable"}/></div>
        <div class="vd-welcome" if={emptyDesigner}>
            <div class="vd-welcome-header"><formatted-message path='designer.text_welcome_header'/></div>
            <div class="vd-button-group">
                <a class="vd-button vd-add-block" title="Add Element" onClick={addBlock}><formatted-message path='designer.text_add_block'/></a>
                <a class="vd-button vd-add-text-block" title="Add text block" onClick={addTextBlock}>
                    <i class="far fa-pencil-square-o"></i>
                    <formatted-message path='designer.text_add_text_block'/>
                </a>
                <a id="vd-add-template" class="vd-button vd-add-template"  onClick={addTemplate}><formatted-message path='designer.text_add_template'/></a>
            </div>
            <div class="vc_welcome-visible-ne">
                <a id="vc_not-empty-add-element" class="vc_add-element-not-empty-button" title="Add Element" data-vc-element="add-element-action" onClick={addBlock}></a>
            </div>
        </div>
    </div>
    <vd-popup-new-block/>
    <vd-popup-setting-block/>
    <vd-popup-layout-block/>
    <vd-popup-save-template/>
    <vd-popup-load-template/>
    <vd-popup-codeview/>
    <textarea style="display:none;" name="{fieldName}">{JSON.stringify(store.getState().blocks[top.opts.id])}</textarea>
    <script>
        this.mixin({store:d_visual_designer})
        this.top = this.parent ? this.parent.top : this
        this.emptyDesigner = _.isEmpty(this.store.getState().blocks[this.top.opts.id])
        this.loading = true
        this.initName = function(){
            this.fieldName = $(this.root).closest('.form-group').find('.d_visual_designer').attr('name')

            this.fieldName = 'vd_content[' + escape(this.fieldName) + ']'
        }
        this.initName()
        addBlock() {
            this.store.dispatch('popup/addBlock', {level: 0, parent_id: '', designer_id: this.top.opts.id});
        }
        addTemplate() {
            this.store.dispatch('template/list', {designer_id: this.top.opts.id});
        }
        saveTemplate() {
            this.store.dispatch('template/save/popup', {designer_id: this.top.opts.id});
        }
        codeView() {
            this.store.dispatch('content/codeview', {designer_id: this.top.opts.id});
        }
        addTextBlock() {
            this.store.dispatch('block/new', {type: 'text', designer_id:this.top.opts.id, target: '', level: 0})
        }
        fullscreen() {
            if ($('.vd.content', this.root).hasClass('fullscreen')) {
                $('.vd.content', this.root).removeClass('fullscreen');
                $(this.root).find('#d_visual_designer_nav').find('#button_full_screen').removeClass('active');
                $('body').removeAttr('style');
            } else {
                $('.vd.content', this.root).addClass('fullscreen');
                $(this.root).find('#d_visual_designer_nav').find('#button_full_screen').addClass('active');
                $('body').attr('style', 'overflow:hidden');
            }
        }
        modeClassic(){
            this.store.dispatch('designer/update/content', {designer_id: this.top.opts.id})
            this.store.dispatch('content/mode/update', {designer_id: this.top.opts.id, mode: 'classic'});
        }
        modeDesigner(){
            this.store.dispatch('content/mode/update', {designer_id: this.top.opts.id, mode: 'designer'});
        }

        frontend() {
            this.store.dispatch('designer/frontend', {designer_id: this.top.opts.id, form: $(this.root).closest('form')})
        }
        this.on('update', function(){
            this.emptyDesigner = _.isEmpty(this.store.getState().blocks[this.top.opts.id])
        })

        this.initMode = function(){
            var mode = this.store.getState().config.mode[this.opts.id]
            if(mode == 'designer') {
                $(this.root).closest('.form-group').find('.note-editor').hide()
                $(this.root).closest('.form-group').find('.cke').hide()
            }
            if(mode == 'classic') {
                $(this.root).closest('.form-group').find('.note-editor').show()
                $(this.root).closest('.form-group').find('.cke').show()
            }
        }

        this.store.subscribe('content/update/text', function(data) {
            var element =  $(this.root).closest('.form-group').find('.d_visual_designer')

            $(element).get(0).innerText = data.text;
            
            if ($(element).hasClass('summernote')) {
                $(element).summernote('code', data.text)
            }
        }.bind(this))

        this.store.subscribe('content/mode/update/success', function(){
            this.initMode();
        }.bind(this))

        $('body').on('designerSave', function(){
            this.store.dispatch('content/save', {designer_id: this.top.opts.id});
        }.bind(this));
    </script>
</visual-designer>