<vd-layout-row_inner class="block-inner block-container {getState().className} {opts.block.id} {getState().activeControl? 'active-control':'deactive-control'}" data-id="{opts.block.id}" id={getState().setting.id? getState().setting.id:null}>
    <virtual if={getState().permission}>
        <div class="block-mouse-toggle"></div>
        <div class="control control-{getState().block_config.setting.control_position} {getState().downControl?'control-down':null}">
            <virtual data-is="control-buttons" block={opts.block}/>
        </div>
        <div class="vd-border vd-border-left"></div>
        <div class="vd-border vd-border-top"></div>
        <div class="vd-border vd-border-right"></div>
        <div class="vd-border vd-border-bottom"></div>
    </virtual>
    <layout-style block={opts.block}/>
    <div class="block-content {contentClassName}" data-is="vd-block-{opts.block.type}" block={opts.block} ref="content"></div>
    <script>
        this.mixin(new vd_component(this, false))
        this.initState({
            setting: this.opts.block.setting.global,
            activeControl: false,
            downControl: false,
            permission: false,
            className: '',
            contentClassName: '',
            block_config: _.find(this.store.getState().config.blocks, function(block){
                return block.type == opts.block.type
            })
        })

        this.store.subscribe('block/control/down', function(data){
            if(data.id == this.opts.block.id) {
                this.setState({downControl: true})
                this.update()
            }
        }.bind(this))

        this.store.subscribe('block/control/normal', function(data){
            if(data.id == this.opts.block.id && !this.activeControl) {
                this.setState({downControl: false})
                this.update()
            }
        }.bind(this))

        this.checkPermission = function(){
            var top = this.getState().top
            var block_config = this.getState().block_config
            if(this.store.getState().config.permission[top.opts.id] && block_config.setting.display_control){
                this.setState('permission', true)
            }
        }

        $(this.root).mouseenter(function(){
            if(!this.getState().activeControl) {
                this.setState('activeControl', true)
                this.store.dispatch('block/control/active', {id: this.opts.block.id})
                this.update()
            }
        }.bind(this))
        $(this.root).mouseleave(function(e){
            var relatedTarget = $(e.target)
            if(this.getState().activeControl) {
                this.setState('activeControl', false)
                this.store.dispatch('block/control/deactive', {id: this.opts.block.id})
                this.update()
            }
        }.bind(this))

        this.initClassNames = function(){
            var className = []
            var contentClassName = []

            var setting = this.getState().setting
            var block_config = this.getState().block_config


            if(setting.background_video){
                className.push('video')
            }
            if(block_config.setting.child) {
                contentClassName.push('child')
            }
            if(setting.align){
                if(setting.align == 'left'){
                    contentClassName.push('justify-content-start')
                }
                if(setting.align == 'center'){
                    contentClassName.push('justify-content-center')
                }
                if(setting.align == 'right'){
                    contentClassName.push('justify-content-end')
                }
            }
            if(setting.design_show_on){
                className.push(_.map(setting.design_show_on, function(value){ return value }).join(' '))
            }
            if(setting.design_animate){
                className.push('animated '+setting.design_animate)
            }
            if(setting.additional_css_class){
                className.push(setting.additional_css_class)
            }
            this.setState({
                className: className.join(' '),
                contentClassName: contentClassName.join(' ')
            })
        }

        this.checkPermission()
        this.initClassNames()


        this.on('update', function(){
            this.setState({
                block_config: _.find(this.store.getState().config.blocks, function(block){
                    return block.type == opts.block.type
                }),
                setting: this.opts.block.setting.global
            })
            this.checkPermission()
            this.initClassNames()
        })
    </script>
</vd-layout-row_inner>