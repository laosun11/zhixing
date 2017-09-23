package com.scy.zhixing.common.page;

import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.binding.MapperMethod;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.MappedStatement.Builder;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

import com.scy.zhixing.common.MyBatisInterceptor;

@Intercepts({ @Signature(type = Executor.class, method = "query", args = { MappedStatement.class, Object.class,
		RowBounds.class, ResultHandler.class }) })
public class PageInterceptor extends MyBatisInterceptor {
	private static final String OFFSET = "firstRowIndex";
	private static final String ROWS = "rows";
	private static final String PARAMS = "params";
	private Dialect dialect=new MySQLDialect();
	private String queryPageMethod;

	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		this.processIntercept(invocation.getArgs());
		return invocation.proceed();
	}

	private void processIntercept(final Object[] queryArgs) {
		MappedStatement ms = (MappedStatement) queryArgs[MAPPED_STATEMENT_INDEX];
		Object parameter = queryArgs[PARAMETER_INDEX];
		String sqlId = ms.getId();
		if (dialect.supportsLimit() && (sqlId.toLowerCase().indexOf(this.queryPageMethod.toLowerCase())>0)) {
			BoundSql boundSql = ms.getBoundSql(parameter);
			String sql = boundSql.getSql().trim();
			int offset = RowBounds.NO_ROW_OFFSET;
			int limit = RowBounds.NO_ROW_LIMIT;
			/**
			 * ParamMap 3.2.2 MapperParamMap 3.1.1
			 */
			if (parameter instanceof MapperMethod.ParamMap<?>) {
				MapperMethod.ParamMap<?> mp = (MapperMethod.ParamMap<?>) parameter;
				Object ofset = mp.get(OFFSET);
				if (ofset != null && ofset instanceof Integer) {
					offset = ((Integer) ofset).intValue();
				}
				Object lmt = mp.get(ROWS);
				if (lmt != null && lmt instanceof Integer) {
					limit = ((Integer) lmt).intValue();
				}
				if (dialect.supportsLimitOffset()) {
					sql = dialect.getLimitString(sql, offset, limit);
					offset = RowBounds.NO_ROW_OFFSET;
				} else {
					sql = dialect.getLimitString(sql, 0, limit);
				}
				limit = RowBounds.NO_ROW_LIMIT;
			}
			// queryArgs[ROWBOUNDS_INDEX] = new RowBounds(offset,limit);
			BoundSql newBoundSql = copyFromBoundSql(ms, boundSql, sql, parameter);
			MappedStatement newMs = copyFromMappedStatement(ms, new BoundSqlSqlSource(newBoundSql));
			queryArgs[MAPPED_STATEMENT_INDEX] = newMs;
		}
	}

	@SuppressWarnings("rawtypes")
	private BoundSql copyFromBoundSql(MappedStatement ms, BoundSql boundSql, String sql, Object parameter) {
		BoundSql newBoundSql = new BoundSql(ms.getConfiguration(), sql, boundSql.getParameterMappings(),
				boundSql.getParameterObject());
		for (ParameterMapping mapping : boundSql.getParameterMappings()) {
			String prop = mapping.getProperty();
			/**
			 * ParamMap 3.2.2 MapperParamMap 3.1.1
			 */
			if (parameter instanceof MapperMethod.ParamMap<?>) {
				MapperMethod.ParamMap<?> mp = (MapperMethod.ParamMap<?>) parameter;
				Object obj = mp.get(PARAMS);
				if (obj != null && obj instanceof java.util.Map) {
					Map map = (Map) obj;
					if (map.containsKey(prop)){
						newBoundSql.setAdditionalParameter(prop, map.get(prop));
					}else{
						//修正分页查询中 foreach参数问题20160119 by xuejianxin
						newBoundSql.setAdditionalParameter(prop, boundSql.getAdditionalParameter(prop)) ;
					}
				}
			}
			
		}
		return newBoundSql;
	}

	private MappedStatement copyFromMappedStatement(MappedStatement ms, SqlSource newSqlSource) {
		Builder builder = new MappedStatement.Builder(ms.getConfiguration(), ms.getId(), newSqlSource,
				ms.getSqlCommandType());

		builder.resource(ms.getResource());
		builder.fetchSize(ms.getFetchSize());
		builder.statementType(ms.getStatementType());
		builder.keyGenerator(ms.getKeyGenerator());
		builder.keyProperty(ms.getKeyProperties() == null ? null : ms.getKeyProperties()[0]);

		// setStatementTimeout()
		builder.timeout(ms.getTimeout());

		// setStatementResultMap()
		builder.parameterMap(ms.getParameterMap());

		// setStatementResultMap()
		builder.resultMaps(ms.getResultMaps());
		builder.resultSetType(ms.getResultSetType());

		// setStatementCache()
		builder.cache(ms.getCache());
		builder.flushCacheRequired(ms.isFlushCacheRequired());
		builder.useCache(ms.isUseCache());

		return builder.build();
	}

	@Override
	public void setProperties(Properties properties) {
		// String dialectType = null;
		try {
			// dialectType = properties.getProperty("dialectType");
			this.dialect = DialectFactory.getDialect();
			if (null == this.dialect) {
				throw new Exception();
			}
			this.queryPageMethod = properties.getProperty("queryPageMethod") == null ? "queryByPage" : properties
					.getProperty("queryPageMethod");
		} catch (Exception e) {
			throw new RuntimeException("cannot create dialect instance by dialectClass:", e);
		}
	}

	public static class BoundSqlSqlSource implements SqlSource {
		BoundSql boundSql;

		public BoundSqlSqlSource(BoundSql boundSql) {
			this.boundSql = boundSql;
		}

		public BoundSql getBoundSql(Object parameterObject) {
			return boundSql;
		}
	}

	public String getQueryPageMethod() {
		return queryPageMethod;
	}

	public void setQueryPageMethod(String queryPageMethod) {
		this.queryPageMethod = queryPageMethod;
	}

	
	
}
