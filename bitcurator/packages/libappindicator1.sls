{% if grains['oscodename'] != 'noble' %}

libappindicator1:
  pkg.installed

{% else %}

libappindicator1 is not available in Noble:
  test.nop

{% endif %}
