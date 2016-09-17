module ApplicationHelper
  def link_to_add_product_variants(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |variant|
      render(association.to_s.singularize + '_fields', f: variant)
    end
    link_to name, '#', class: 'add_fields', data: { id: id, fields: fields.gsub("\n", '') }
  end
end
