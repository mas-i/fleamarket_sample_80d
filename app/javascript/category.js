$(function(){
  $(function(){
    function appendOption(category){
      let html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子カテゴリーを表示させる。
    function appendChildrenBox(insertHTML){
      let childSelectHtml = '';
      // childSelectHtml = `<div class='exhibitionPage__main__contents__detail__category__choose__added' id= 'child_category'>
      //                     <div class='exhibitionPage__main__contents__detail__category__choose1'>
      //                       <select class="exhibitionPage__main__contents__detail__category__choose--select" id="child_category_id" name="item[category_id]">
      //                         <option value="---" data-category="---">---</option>
      //                         ${insertHTML}
      //                       </select>
      //                     </div>
      //                   </div>`;

      childSelectHtml = `<div class="item-detail__inner__box" id= "child_category_box_id">
                          <div class="item-detail__inner__box__select">
                            <select class="item-detail__inner__box--select" id="child_category_id" name="item[category_id]">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                            </select>
                          </div>
                        </div>`;

      $('.item-detail__inner_category').append(childSelectHtml);
    }
    // 孫カテゴリーを表示させる。
    function appendGrandchildrenBox(insertHTML){
      let grandchildSelectHtml = '';
      // grandchildSelectHtml = `<div class='exhibitionPage__main__contents__detail__category__choose__added' id= 'grandchild_category'>
      //                           <div class='exhibitionPage__main__contents__detail__category__choose2'>
      //                             <select class="exhibitionPage__main__contents__detail__category__choose__box--select" id="grandchild_category" name="item[category_id]">
      //                               <option value="---" data-category="---">---</option>
      //                               ${insertHTML}
      //                             </select>
      //                           </div>
      //                         </div>`;

      grandchildSelectHtml =`<div class="item-detail__inner__box" id= "grandchild_category_box_id">
                                <div class="item-detail__inner__box__select">
                                  <select class="item-detail__inner__box__select" id="grandchild_category" name="item[category_id]">
                                    <option value="---" data-category="---">---</option>
                                    ${insertHTML}
                                  </select>
                                </div>
                              </div>`;

      $('.item-detail__inner_category').append(grandchildSelectHtml);
    }
    
    // 親カテゴリーを選択した後にイベント発火させる。
    $('#parent_category').on('change', function(){
      console.log($('#parent_category'));
      // 選択された親カテゴリーのidを取得
      let parent_category_id = document.getElementById
      ('parent_category').value; 
      if (parent_category_id != "---"){ 
        $.ajax({
          url: '/items/category/get_category_children',
          type: 'GET',
          data: { parent_id: parent_category_id },
          dataType: 'json'
        })
        .done(function(children){         
          // 親カテゴリー削除された時、子・孫カテゴリーを削除する。
          console.log(children)

          $("#child_category_box_id").remove(); 
          $("#grandchild_category_box_id").remove();
          console.log($('child_category'))
          // debugger;
          let insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChildrenBox(insertHTML);
        })
        // エラー警告
        .fail(function(){
          $("#child_category_box_id").remove();
          $("#grandchild_category_box_id").remove(); 
          alert('カテゴリーを選択してください');
        })
      }else{
        $("#child_category_box_id").remove(); 
        $("#grandchild_category_box_id").remove();
      }
    });
    $('.content-sale__main__box__form').on('change', '#child_category_id', function(){
      let child_category_id = document.getElementById('child_category_id').value; 
      // let child_category_id = $('#child_category option:selected').data('category');
      // データが取得できていないからチェック#child_category option:selected
      // debugger;
      console.log(child_category_id );

      if (child_category_id != "---"){ 
        $.ajax({
          url: '/items/category/get_category_grandchildren',
          type: 'GET',
          data: { child_id: child_category_id },
          dataType: 'json'
        })
      
        .done(function(grandchildren){
          console.log(grandchildren)

          if (grandchildren.length != 0) {
            // 子カテゴリーが変更された時、孫カテゴリーを削除する。
            $("#grandchild_category_box_id").remove(); 
            let insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchildrenBox(insertHTML);
          }
        })
        // エラー警告
        .fail(function(){
          $("#grandchild_category_box_id").remove(); 
          alert('カテゴリーを選択してください');
        })
      }else{
        $("#grandchild_category_box_id").remove(); 
      }
    });
  });
});