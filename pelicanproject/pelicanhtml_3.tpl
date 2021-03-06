{%- extends 'basic.tpl' -%}
{% if EXTRA_HEADER %}
{{ EXTRA_HEADER }}
{% endif %}
<script type="text/javascript">
alert('test')
jQuery(document).ready(function($) {
    $("div.collapseheader").click(function () {
    $header = $(this).children("span").first();
    $codearea = $(this).children(".input_area");
    console.log($(this).children());
    $codearea.slideToggle(500, function () {
        $header.text(function () {
            return $codearea.is(":visible") ? "Collapse Code" : "Expand Code";
        });
    });
});
});
</script>
{% block stream_stdout -%}
<div class="output_subarea output_stream output_stdout output_text">
<pre class="ipynb">
{{- output.text | ansi2html -}}
</pre>
</div>
{%- endblock stream_stdout %}

{% block stream_stderr -%}
<div class="output_subarea output_stream output_stderr output_text">
<pre class="ipynb">
{{- output.text | ansi2html -}}
</pre>
</div>
{%- endblock stream_stderr %}

{% block error -%}
<div class="output_subarea output_text output_error">
<pre class="ipynb">
{{- super() -}}
</pre>
</div>
{%- endblock error %}

{%- block data_text scoped %}
<div class="output_text output_subarea {{extra_class}}">
<pre class="ipynb">
{{- output.data['text/plain'] | ansi2html -}}
</pre>
</div>
{%- endblock -%}

{% block input %}
{% if "# <!-- collapse=True -->" in cell.source %}
<div class="collapseheader inner_cell"><span style="font-weight: bold;">Expand Code</span>
<div class="input_area" style="display:none">
{{ cell.source.replace("# <!-- collapse=True -->\n", "") | highlight_code(metadata=cell.metadata) }}
</div>
</div>
{% elif "# <!-- collapse=False -->" in cell.source %}
<div class="collapseheader inner_cell"><span style="font-weight: bold;">Collapse Code</span>
<div class="input_area">
{{ cell.source.replace("# <!-- collapse=False -->\n", "") | highlight_code(metadata=cell.metadata) }}
</div>
</div>
{% else %}
<div class="inner_cell">
    <div class="input_area">
        {{ cell.source | highlight_code(metadata=cell.metadata) }}
    </div>
</div>
{% endif %}
{%- endblock input %}
