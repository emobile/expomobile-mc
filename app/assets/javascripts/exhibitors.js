$(function() {
  $.getJSON(
          "exhibitors/get_all_exhibitor_contacts",
          function(data) {
            var accentMap = {
              "Á": "A",
              "Ä": "A",
              "á": "a",
              "ä": "a",
              "É": "E",
              "Ë": "E",
              "é": "e",
              "ë": "e",
              "Í": "I",
              "Ï": "I",
              "í": "i",
              "ï": "i",
              "Ó": "O",
              "Ö": "O",
              "ó": "o",
              "ö": "o",
              "Ú": "U",
              "Ü": "U",
              "ú": "u",
              "ü": "u"
            };

            var normalize = function(term) {
              var ret = "";
              for (var i = 0; i < term.length; i++) {
                ret += accentMap[ term.charAt(i) ] || term.charAt(i);
              }
              return ret;
            };

            $("#search_field").autocomplete({
              source: function(request, response) {
                var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
                response($.grep(data, function(value) {
                  value = value.label || value.value || value;
                  return matcher.test(value) || matcher.test(normalize(value));
                }));
              },
              minLength: 2,
              autoFocus: true,
              select: function(e, ui) {
                $(this).val(ui.item.value);
                $("#search_form").submit();
              },
              messages: {}
            });
          }
  );
});