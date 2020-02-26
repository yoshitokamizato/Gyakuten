ActiveAdmin.register_page "TextSort" do
  # ドロップダウンメニューの親成分を決定
  menu parent: "テキスト教材", label: "並び替え"

  content do
    render partial: "admin/texts_sort"
  end

  controller do
    def index
      @texts = Text.show_contents_list
    end
  end
end
