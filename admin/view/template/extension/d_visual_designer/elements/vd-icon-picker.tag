<vd-icon-picker>
    <input type="text" class="form-control" name="{opts.name}" value="{opts.riotValue}" onchange={change}>
    <script>
        this.library = this.opts.library
        this.on('mount', function(){
            that = this
            this.picker = $('input[name="'+this.opts.name+'"]', this.root).fontIconPicker({
                source: $.iconset[this.opts.library],
                emptyIcon: false,
                hasSearch: true,
                iconsPerPage: 1000
            }).on('change', function(e){
                if(that.opts.riotValue !== $(this).val()) {
                    console.log(e)
                    $('input[name="'+that.opts.name+'"]', that.root).val($(this).val())
                    that.opts.change(e)
                }
            })
        })
        this.on('update', function(e){
            if(this.library !== this.opts.library) {
                this.library = this.opts.library
                this.picker.setIcons($.iconset[this.opts.library]);
            }
        })
    </script>
</vd-icon-picker>