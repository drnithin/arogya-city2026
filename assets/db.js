// db.js — shared Supabase client + helpers
const { SUPABASE_URL, SUPABASE_ANON_KEY, EVIDENCE_BUCKET } = window.AC_CONFIG;

const sb = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

const DB = {
  async getPledge(token) {
    const { data, error } = await sb.from('pledges').select('*').eq('token', token).single();
    if (error) throw error;
    return data;
  },

  async getSubmission(token) {
    const { data } = await sb.from('submissions').select('*').eq('token', token).maybeSingle();
    return data;
  },

  async openSubmission(pledge) {
    let sub = await this.getSubmission(pledge.token);
    if (!sub) {
      const { data } = await sb.from('submissions')
        .insert({ pledge_id: pledge.id, token: pledge.token, status: 'partial', opened_at: new Date().toISOString() })
        .select().single();
      return data;
    }
    if (sub.status === 'not_opened') {
      await sb.from('submissions')
        .update({ status: 'partial', opened_at: new Date().toISOString() })
        .eq('token', pledge.token);
    }
    return sub;
  },

  async saveAnswers(token, answers, closing, status) {
    const patch = { answers, closing };
    if (status) patch.status = status;
    if (status === 'submitted') patch.submitted_at = new Date().toISOString();
    const { error } = await sb.from('submissions').update(patch).eq('token', token);
    if (error) throw error;
  },

  async uploadEvidence(token, commitmentIndex, file) {
    const safe = file.name.replace(/[^a-zA-Z0-9._-]/g, '_');
    const path = `${token}/c${commitmentIndex}-${Date.now()}-${safe}`;
    const { error } = await sb.storage.from(EVIDENCE_BUCKET).upload(path, file, { upsert: true });
    if (error) throw error;
    const { data } = sb.storage.from(EVIDENCE_BUCKET).getPublicUrl(path);
    return { url: data.publicUrl, name: file.name };
  },

  async allForDashboard() {
    const { data: pledges } = await sb.from('pledges').select('*').order('org');
    const { data: subs } = await sb.from('submissions').select('*');
    const byToken = {};
    (subs || []).forEach(s => { byToken[s.token] = s; });
    return (pledges || []).map(p => ({ pledge: p, sub: byToken[p.token] || null }));
  },

  async addPledge(row) {
    const { data, error } = await sb.from('pledges').insert(row).select().single();
    if (error) throw error;
    await sb.from('submissions').insert({ pledge_id: data.id, token: data.token, status: 'not_opened' });
    return data;
  }
};

window.DB = DB;
