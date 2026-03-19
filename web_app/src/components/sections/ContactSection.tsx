'use client';
import React, { useState } from 'react';
import styles from './ContactSection.module.css';

export default function ContactSection() {
  const [formData, setFormData] = useState({
    nome: '',
    email: '',
    telefone: '',
    assunto: '',
    descricao: ''
  });

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const isFormValid = formData.nome && formData.email && formData.descricao && formData.assunto;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!isFormValid) return;

    const mensagem = `Pedido de orçamento de ${formData.nome}\n\nE-mail: ${formData.email}\nTelefone: ${formData.telefone}\nAssunto: ${formData.assunto}\nDescrição: ${formData.descricao}`;
    const numeroWhatsapp = '+5575981714919';
    const whatsappUrl = `https://api.whatsapp.com/send?phone=${numeroWhatsapp}&text=${encodeURIComponent(mensagem)}`;
    
    window.open(whatsappUrl, '_blank');
  };

  return (
    <section id="orcamento" className={styles.contactSection}>
      <div className={`container ${styles.container}`}>
        <h2 className="section-title">ORÇAMENTO</h2>
        
        <div className={styles.formWrapper}>
          <div className={styles.formContainer}>
            <h3 className={styles.formTitle}>ENVIE SEU ORÇAMENTO</h3>
            <form onSubmit={handleSubmit} className={styles.form}>
              <div className={styles.inputGroup}>
                <label>Nome (obrigatório)</label>
                <input type="text" name="nome" value={formData.nome} onChange={handleChange} required />
              </div>
              <div className={styles.inputGroup}>
                <label>Email (obrigatório)</label>
                <input type="email" name="email" value={formData.email} onChange={handleChange} required />
              </div>
              <div className={styles.inputGroup}>
                <label>Telefone</label>
                <input type="tel" name="telefone" value={formData.telefone} onChange={handleChange} />
              </div>
              <div className={styles.inputGroup}>
                <label>Assunto</label>
                <select name="assunto" value={formData.assunto} onChange={handleChange} required>
                  <option value="">Selecione um assunto</option>
                  <option value="PROJETOS">PROJETOS</option>
                  <option value="CONSTRUÇÕES">CONSTRUÇÕES</option>
                  <option value="ADEQUAÇÕES">ADEQUAÇÕES</option>
                  <option value="OUTROS">OUTROS</option>
                </select>
              </div>
              <div className={styles.inputGroup}>
                <label>Descrição</label>
                <textarea name="descricao" rows={5} value={formData.descricao} onChange={handleChange} required></textarea>
              </div>
              <button 
                type="submit" 
                className={`${styles.submitBtn} ${isFormValid ? styles.validBtn : styles.invalidBtn}`}
                disabled={!isFormValid}
              >
                Enviar via WhatsApp
              </button>
              <p className={styles.formHelp}>Você precisa preencher todos os campos obrigatórios para enviar.</p>
            </form>
          </div>
        </div>
      </div>

      <footer className={styles.footer}>
        <div className={`container ${styles.footerContainer}`}>
          <div className={styles.footerCol}>
            <p><strong>NOME DA EMPRESA:</strong> Everton Silva Construtora</p>
            <p><strong>TELEFONE:</strong> +55 71 98441-4420</p>
          </div>
          <div className={`${styles.footerCol} ${styles.textRight}`}>
            <p><strong>E-MAIL:</strong> adm@construrota.net</p>
            <p><strong>INSTAGRAM:</strong> @esconstrutorasilva</p>
          </div>
        </div>
      </footer>
    </section>
  );
}
