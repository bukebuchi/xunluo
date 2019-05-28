define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'arrest/index',
                    add_url: 'arrest/add',
                    edit_url: 'arrest/edit',
                    del_url: 'arrest/del',
                    multi_url: 'arrest/multi',
                    table: 'arrest',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'weigh',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id'),visible:false},
                        {field: 'admin_id', title: __('Admin_id'),visible:false},
                        {field: 'category_id', title: __('Category_id'),visible:false},
                        {field: 'category_ids', title: __('Category_ids'),visible:false},
                        {field: 'name', title: __('Name')},
                        {field: 'identity_id', title: __('Identity')},
                        {field: 'genderdata_text', title: __('Genderdata'), operate:false},
                        {field: 'hobbydata_text', title: __('Hobbydata'), operate:false, formatter: Table.api.formatter.label},
                        {field: 'title', title: __('Title')},
                        {field: 'image', title: __('Image'), formatter: Table.api.formatter.image},
                        {field: 'images', title: __('Images'), formatter: Table.api.formatter.images,visible:false},
                        {field: 'attachfile', title: __('Attachfile'),visible:false},
                        {field: 'keywords', title: __('Keywords')},
                        {field: 'description', title: __('Description')},
                        {field: 'city', title: __('City'),visible:false},
                        {field: 'price', title: __('Price'),visible:false},
                        {field: 'views', title: __('Views')},
                        {field: 'startdate', title: __('Startdate'),visible:false},
                        {field: 'activitytime', title: __('Activitytime')},
                        {field: 'year', title: __('Year'),visible:false},
                        {field: 'times', title: __('Times'),visible:false},
                        {field: 'refreshtime', title: __('Refreshtime'), formatter: Table.api.formatter.datetime,visible:false},
                        {field: 'createtime', title: __('Createtime'), formatter: Table.api.formatter.datetime,visible:false},
                        {field: 'updatetime', title: __('Updatetime'), formatter: Table.api.formatter.datetime,visible:false},
                        {field: 'weigh', title: __('Weigh'),visible:false},
                        {field: 'switch', title: __('Switch'),visible:false},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.status,visible:false},
                        {field: 'state_text', title: __('State'), operate:false,visible:false},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});