FROM ghcr.io/open-webui/open-webui:latest-ollama

ARG MODEL_LIST="mistral-small3.2"

RUN ollama serve & \
    sleep 5 && \
    for MODEL in $MODEL_LIST; do \
        echo "Pulling model: $MODEL"; \
        ollama pull "$MODEL"; \
    done
