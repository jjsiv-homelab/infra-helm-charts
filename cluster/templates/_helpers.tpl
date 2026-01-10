{{/* Builds cluster addons labels. Only for connections to central cluster */}}
{{- define "cluster.addons" -}}
{{- range $name, $val := .Values.addons }}
addon/{{ $name }}: {{ quote $val.enabled }}
{{- end -}}
{{- end -}}

{{/* Builds cluster connection configuration */}}
{{- define "cluster.config" -}}
{{- if .config.kubeconfigSecretRef }} 
kubeconfigSecretRef: 
  name: {{ .config.kubeconfigSecretRef.name }}
  namespace: {{ .config.kubeconfigSecretRef.namespace }}
  key: {{ .config.kubeconfigSecretRef.key }}
{{- end }}
{{- if .config.tlsClientConfig }}
tlsClientConfig:
  {{- toYaml .config.tlsClientConfig | nindent 2 }}
{{- end }}
{{- end -}}
