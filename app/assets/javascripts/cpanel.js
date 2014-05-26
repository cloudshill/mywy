//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require jquery.autosize
//= require jquery.validate
//= require upload/vendor/jquery.ui.widget
//= require upload/jquery.iframe-transport
//= require upload/jquery.fileupload
//= require simditor
//= require artDialog/artDialog
//= require jquery.ztree.all-3.5.min
//= require turbolinks
//= require cpanel/movies

$(document).ready(function(){
    $('[data-behaviors~=autosize]').autosize();
});

$(function(){
    $('#phone-navigation #phone-menu').change(function(){
        var url = $(this).val();
        if(url) {
            window.location = url;
        }
    });
});

var fancyFilter = function(filterListSelector, gallerySelector) {
    //Filter Button Code
    $(filterListSelector + ' a').click(function() {
        $(filterListSelector + ' li').removeClass('active');
        var $this = $(this);
        var filterType = $this.data('filter');
        if(!filterType) return true;

        $this.closest('li').addClass('active');
        $(gallerySelector).isotope({ 
            filter: filterType,
        });

        return false;
    });
};

function filter(treeId, parentNode, childNodes) {
  if (!childNodes) return null;  
  for (var i=0, l=childNodes.length; i<l; i++) {
    childNodes[i] = {id:childNodes[i].id, pId: childNodes[i].parent_id, name:childNodes[i].name.replace('',''), isParent:true, open:true};
  }  
  return childNodes;  
};
function beforeRemove(treeId, treeNode) {
  var zTree = $.fn.zTree.getZTreeObj("ztree");
  zTree.selectNode(treeNode);
  return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
};
function onRemove(event, treeId, treeNode) {
  $.ajax({
    url: window.location.href + "/" + treeNode.id,
    type: "DELETE"
  });
};
function beforeRename(treeId, treeNode, newName) {
  if (newName.length == 0) {
    alert("");
    return false;
  }
  return true;
};
function onRename(event, treeId, treeNode, isCancel) {
  //alert(window.location.href + "/" + treeNode.id);
  $.ajax({
    url: window.location.href + "/" + treeNode.id,
    type: "PUT",
    data: {
      tn: {
        name: treeNode.name
      }
    }
  });
};
function beforeDrag(treeId, treeNodes) {
};
function beforeDrop(treeId, treeNodes, targetNode, moveType) {
};
var newCount = 1;
function addHoverDom(treeId, treeNode) {
  var sObj = $("#" + treeNode.tId + "_span");
  if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
  var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
    + "' title='add node' onfocus='this.blur();'></span>";
  sObj.after(addStr);
  var btn = $("#addBtn_"+treeNode.tId);
  if (btn) btn.bind("click", function() {
    $.ajax({
      url: window.location.href,
      type: "POST",
      data: {
        tn: {
          name: "新节点",
          parent_id: treeNode.id
        }
      },
      success: function(data, textStatus) {
        var zTree = $.fn.zTree.getZTreeObj("ztree");
        zTree.addNodes(treeNode, {id: data.id, pId: treeNode.id, name: data.name});
      }
    });
    
    return false;
  });
};
function removeHoverDom(treeId, treeNode) {
  $("#addBtn_" + treeNode.tId).unbind().remove();
};
