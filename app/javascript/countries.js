document.addEventListener('turbolinks:load', function() {
    var el = document.getElementById('countries-list');
    if (el) {
      var sortable = Sortable.create(el, {
        // SortableJS options
        onEnd: function(evt) {
          var countryIds = Array.from(el.children).map(function(item) {
            return item.getAttribute('data-id');
          });
  
          // Make an AJAX call to update ranks
          fetch('/countries/update_ranks', { // Use your actual path here
            method: 'PATCH',
            headers: {
              'Content-Type': 'application/json',
              'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            body: JSON.stringify({ country_ids: countryIds })
          });
        }
      });
    }
  });
  