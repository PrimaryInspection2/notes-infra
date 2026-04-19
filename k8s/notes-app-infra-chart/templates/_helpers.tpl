{{/*
Selector labels for postgres — used in selector.matchLabels and pod template labels.
These must never change after the first deploy (immutable in Kubernetes).
*/}}
{{- define "infra.postgres.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.postgres.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Full labels for postgres — used in metadata.labels of every postgres resource.
Includes chart version for observability. Builds on top of selectorLabels.
*/}}
{{- define "infra.postgres.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- include "infra.postgres.selectorLabels" . | nindent 0 }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for zipkin — used in selector.matchLabels and pod template labels.
These must never change after the first deploy (immutable in Kubernetes).
*/}}
{{- define "infra.zipkin.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.zipkin.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Full labels for zipkin — used in metadata.labels of every zipkin resource.
Includes chart version for observability. Builds on top of selectorLabels.
*/}}
{{- define "infra.zipkin.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- include "infra.zipkin.selectorLabels" . | nindent 0 }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
