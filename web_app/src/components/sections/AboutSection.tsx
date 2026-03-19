'use client';

import React from 'react';
import Link from 'next/link';
import styles from './AboutSection.module.css';
import { motion } from 'framer-motion';

export default function AboutSection() {
  const imagePaths = [
    '/assets/images/imagem.jpeg',
    '/assets/images/imagem2.jpeg',
    '/assets/images/imagem22.jpeg',
    '/assets/images/imagem4.jpeg',
  ];

  return (
    <section id="sobre" className={styles.aboutSection}>
      <div className={`container ${styles.container}`}>
        <div className={styles.grid}>
          {/* Text Content */}
          <motion.div
            initial={{ opacity: 0, x: -50 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true, margin: "-100px" }}
            transition={{ duration: 0.6 }}
            className={styles.textContent}
          >
            <h2 className="section-title" style={{ textAlign: 'left' }}>SOBRE NÓS</h2>
            <div className={styles.description}>
              <p>
                A <strong>ES Construtora</strong> foi fundada em junho de 2015 com o objetivo de atender as necessidades de manutenção e ampliações da indústria de alimentos, com padrões específicos de segurança, qualidade e prazos de execução rigorosamente estabelecidos pelos nossos clientes.
              </p>
              <p>
                Temos como foco constante o compromisso de apresentar soluções técnicas para diversos tipos e segmentos de obras civis, buscando excelência na qualidade, segurança e total comprometimento com os objetivos a serem atingidos.
              </p>
              <p>
                Nos últimos anos, alcançamos grandes clientes e demonstramos uma vasta capacidade de execução de atividades variadas em vários estados brasileiros, consolidando nossa posição no mercado.
              </p>
            </div>

            <div style={{ marginTop: '2rem' }}>
              <Link href="/galeria" className="btn-primary" style={{ display: 'inline-block', textDecoration: 'none' }}>
                VER OBRAS
              </Link>
            </div>
          </motion.div>

          {/* Media Grid */}
          <motion.div
            initial={{ opacity: 0, x: 50 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true, margin: "-100px" }}
            transition={{ duration: 0.6, delay: 0.2 }}
            className={styles.mediaGrid}
          >
            {imagePaths.map((path, index) => (
              <div key={index} className={styles.mediaCard}>
                <div
                  className={styles.mediaImage}
                  style={{ backgroundImage: `url(${path})` }}
                />
              </div>
            ))}
          </motion.div>
        </div>
      </div>
    </section>
  );
}
