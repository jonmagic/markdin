require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  test "sets uuid before create and does not overwrite on save" do
    document = Document.new do |d|
      d.body = "# Foo"
    end

    assert_nil document.uuid
    document.save
    uuid = document.uuid
    assert_not_nil uuid

    document.save
    assert_equal uuid, document.uuid
  end

  test "sets rendered_body to Markdown rendered body on save" do
    document = Document.new do |d|
      d.body = "# Foo"
    end

    assert_nil document.rendered_body
    document.save
    assert_equal "<h1>Foo</h1>\n", document.rendered_body

    document.body = "# Bar"
    document.save
    assert_equal "<h1>Bar</h1>\n", document.rendered_body
  end
end
