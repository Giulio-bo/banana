# 1. Base Python
FROM python:3.11-slim

# 2. Installa dipendenze di sistema e strumenti per lo scraping/bypass
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

# 5. Esponi la porta
ENV PORT=7860
EXPOSE 7860

# 6. Avvia l'applicazione
CMD ["python", "main.py"]
