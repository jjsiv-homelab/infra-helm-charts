{{- define "cluster.addons" -}}
{{- range $name, $val := .Values.addons }}
addon/{{ $name }}: {{ quote $val }}
{{- end -}}
{{- end -}}
