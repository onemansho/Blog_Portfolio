import $ from "jquery";

// Turbo-compatible "Add Technology" handler
document.addEventListener("turbo:load", () => {
  $(document).off('click', '.add_fields').on('click', '.add_fields', function(e) {
    e.preventDefault(); // prevent default link behavior

    const $link = $(this);
    const template = $link.data('association-insertion-template');
    const insertionNodeSelector = $link.data('association-insertion-node') || $link.closest('.nested-fields').parent();
    const insertionMethod = $link.data('association-insertion-method') || 'append';

    if (!template || !insertionNodeSelector) return;

    const $insertionNode = $(insertionNodeSelector);

    const $newField = $(template);

    if (insertionMethod === 'append') {
      $insertionNode.append($newField);
    } else if (insertionMethod === 'prepend') {
      $insertionNode.prepend($newField);
    }

    $newField.trigger('cocoon:after-insert', [$newField]);
  });
});
