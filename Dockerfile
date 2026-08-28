# 1. Base Python
FROM python:3.11-slim

# 2. Installa dipendenze di sistema e browser per lo scraping
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# 3. Clona il codice sorgente di EasyProxy
WORKDIR /app
RUN git clone https://github.com/realbestia1/EasyProxy.git .

# 4. Installa i requisiti Python
RUN pip install --no-cache-dir -r requirements.txt

# 5. Configura porta e variabili d'ambiente
ENV PORT=7860
ENV PYTHONUNBUFFERED=1
EXPOSE 7860

# 6. Avvia con fallback automatico sul file corretto
CMD ["sh", "-c", "if [ -f app.py ]; then python app.py; elif [ -f server.py ]; then python server.py; else python -m easyproxy; fi"]
