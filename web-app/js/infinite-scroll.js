Ext.require([
    'Ext.grid.*',
    'Ext.data.*',
    'Ext.util.*',
    'Ext.grid.plugin.BufferedRenderer'
]);


Ext.onReady(function(){
    Ext.define('ForumThread', {
        extend: 'Ext.data.Model',
        fields: [
            'id', 'name', {
                name: 'division',
                mapping: 'division.name',
                type: 'string'
            },  {
                name: 'validFrom',
                mapping: 'validFrom',
                type: 'date'
            },
            {
                name: 'validTo',
                mapping: 'validTo',
                type: 'date'
            }
        ],
        idProperty: 'id'
    });

    // create the Data Store
    var store = Ext.create('Ext.data.Store', {
        id: 'store',
        model: 'ForumThread',
        remoteGroup: true,
        // allow the grid to interact with the paging scroller by buffering
        buffered: true,
        leadingBufferZone: 300,
        pageSize: 100,
        proxy: {
            // load using script tags for cross domain, if the data in on the same domain as
            // this page, an Ajax proxy would be better
            type: 'jsonp',
            url: 'http://localhost:8080/extjstest/dataGrid/list',
            reader: {
                root: 'resources',
                totalProperty: 'totalCount'
            },
            // sends single sort as multi parameter
            simpleSortMode: true,
            // sends single group as multi parameter
            simpleGroupMode: true,

            // This particular service cannot sort on more than one field, so grouping === sorting.
            groupParam: 'sort',
            groupDirectionParam: 'dir'
        },
        sorters: [{
            property: 'name',
            direction: 'ASC'
        }],
        autoLoad: true,
        listeners: {

            // This particular service cannot sort on more than one field, so if grouped, disable sorting
            groupchange: function(store, groupers) {
                var sortable = !store.isGrouped(),
                    headers = grid.headerCt.getVisibleGridColumns(),
                    i, len = headers.length;
                
                for (i = 0; i < len; i++) {
                    headers[i].sortable = (headers[i].sortable !== undefined) ? headers[i].sortable : sortable;
                }
            },

            // This particular service cannot sort on more than one field, so if grouped, disable sorting
            beforeprefetch: function(store, operation) {
                if (operation.groupers && operation.groupers.length) {
                    delete operation.sorters;
                }
            }
        }
    });

    function renderTopic(value, p, record) {
        return Ext.String.format(
            '<a href="http://localhost:8080/extjstest/resource/show/{1}" target="_blank">{0}</a>',
            value,
            record.getId()
        );
    }

    var grid = Ext.create('Ext.grid.Panel', {
        width: 800,
        height: 600,
        collapsible: true,
        title: 'Resources list',
        store: store,
        loadMask: true,
        selModel: {
            pruneRemoved: false
        },
        multiSelect: true,
        viewConfig: {
            trackOver: false
        },
        features:[{
            ftype: 'grouping',
            hideGroupedHeader: false
        }],
        // grid columns
        columns:[{
            xtype: 'rownumberer',
            width: 50,
            sortable: false
        },{
            text: "Id",
            dataIndex: 'id',
            width: 50,
            sortable: true
        },{
            text: "Name",
            dataIndex: 'name',
            flex: 1,
            renderer: renderTopic,
            sortable: true
        },{
            text: "Division",
            dataIndex: 'division',
            width: 200,
            hidden: false,
            sortable: true
        },{
            id: 'validFrom',
            text: 'Valid From',
            dataIndex: 'validFrom',
            width: 130,
            renderer: Ext.util.Format.dateRenderer('d.m.Y G:i'),
            sortable: true,
            groupable: false
        },{
            id: 'validTo',
            text: 'Valid To',
            dataIndex: 'validTo',
            width: 130,
            renderer: Ext.util.Format.dateRenderer('d.m.Y G:i'),
            sortable: true,
            groupable: false
        }],
        renderTo: Ext.getBody()
    });
});