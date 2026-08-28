FROM ghcr.io/realbestia1/easyproxy:full-hf

EXPOSE 7860

CMD ["python", "main.py"]
